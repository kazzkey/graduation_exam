# == Schema Information
#
# Table name: exams
#
#  id         :bigint           not null, primary key
#  deadline   :date             not null
#  release    :boolean          default(FALSE), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :bigint
#
# Indexes
#
#  index_exams_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#
require 'rails_helper'

RSpec.describe Exam, type: :model do
  let(:image_path) { File.join(Rails.root, 'spec/factories/test.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  before do
    Subject.create(id: 1, name: 'Japanese')
  end

  it 'タイトルがない場合、無効である' do
    exam = Exam.new(
      title: nil,
      deadline: '2020-12-31',
      release: false,
      subject_id: 1,
    )
    expect(exam).to be_invalid
  end

  it '科目が設定されていない場合、無効である' do
    exam = Exam.new(
      title: 'Test',
      deadline: '2020-12-31',
      release: false,
      subject_id: nil,
    )
    expect(exam).to be_invalid
  end

  it '締切が設定されていない場合、無効である' do
    exam = Exam.new(
      title: 'Test',
      deadline: nil,
      release: false,
      subject_id: 1,
    )
    expect(exam).to be_invalid
  end

  it '締切が過去の場合、無効である' do
    exam = Exam.new(
      title: 'Test',
      deadline: '2001-01-01',
      release: false,
      subject_id: 1,
    )
    expect(exam).to be_invalid
  end

  it '公開は未入力でも、デフォルトでfalseが入り、有効である' do
    exam = Exam.new(
      title: 'Test',
      deadline: '2020-12-31',
      release: nil,
      subject_id: 1,
    )
    expect(exam).to be_valid
  end

  it '試験情報が正しく、問題も正しく入力されている場合、有効である' do
    exam = Exam.new(
      title: 'Test',
      deadline: '2020-12-31',
      release: false,
      subject_id: 1,
    )
    question = exam.questions.build(
      image: image,
      content: 'TestContent',
      correct_answer: 1,
    )
    expect(exam).to be_valid
  end

  it '試験情報は正しいが、問題の正解が未入力ならば、無効である' do
    exam = Exam.new(
      title: 'Test',
      deadline: '2020-12-31',
      release: false,
      subject_id: 1,
    )
    question = exam.questions.build(
      image: image,
      content: 'TestContent',
      correct_answer: nil,
    )
    expect(exam).to be_invalid
  end

  it '試験情報は正しいが、問題の内容が未入力ならば、無効である' do
    exam = Exam.new(
      title: 'Test',
      deadline: '2020-12-31',
      release: false,
      subject_id: 1,
    )
    question = exam.questions.build(
      image: image,
      content: nil,
      correct_answer: 1,
    )
    expect(exam).to be_invalid
  end
end

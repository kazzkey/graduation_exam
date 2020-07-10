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
#
require 'rails_helper'

RSpec.describe Exam, type: :model do
  it 'タイトル、締切、公開が設定されている場合、有効である' do
    exam = Exam.new(
      title: 'test',
      deadline: '2020-12-31',
      release: false,
    )
    expect(exam).to be_valid
  end

  it 'タイトルがない場合、無効である' do
    exam = Exam.new(
      title: nil,
      deadline: '2020-12-31',
      release: false,
    )
    expect(exam).to be_invalid
  end

  it '締切がない場合、無効である' do
    exam = Exam.new(
      title: 'test',
      deadline: nil,
      release: false,
    )
    expect(exam).to be_invalid
  end

  it '締切が過去の場合、無効である' do
    exam = Exam.new(
      title: 'test',
      deadline: '2001-01-01',
      release: false,
    )
    expect(exam).to be_invalid
  end

  it '公開は未入力でも、デフォルトでfalseが入る' do
    exam = Exam.new(
      title: 'test',
      deadline: '2020-12-31',
      release: nil,
    )
    expect(exam).to be_valid
  end
end

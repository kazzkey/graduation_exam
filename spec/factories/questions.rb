# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  content        :text             not null
#  correct_answer :integer          not null
#  description    :string
#  image          :string
#  rate           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  exam_id        :bigint
#
# Indexes
#
#  index_questions_on_exam_id  (exam_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#
FactoryBot.define do
  factory :question do
    content { 'QuestionText' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/test.jpg')) }
    correct_answer { 1 }
    description { 'QuestionDescription' }
    exam { nil }
  end
end

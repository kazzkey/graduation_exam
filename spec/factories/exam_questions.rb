# == Schema Information
#
# Table name: exam_questions
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  exam_id     :bigint
#  question_id :bigint
#
# Indexes
#
#  index_exam_questions_on_exam_id      (exam_id)
#  index_exam_questions_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#  fk_rails_...  (question_id => questions.id)
#
FactoryBot.define do
  factory :exam_question do
    exam_id { 1 }
    question_id { 1 }
  end
end

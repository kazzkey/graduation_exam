# == Schema Information
#
# Table name: answers
#
#  id              :bigint           not null, primary key
#  choice          :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  answer_sheet_id :bigint
#  question_id     :bigint
#
# Indexes
#
#  index_answers_on_answer_sheet_id  (answer_sheet_id)
#  index_answers_on_question_id      (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (answer_sheet_id => answer_sheets.id)
#  fk_rails_...  (question_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :answer_sheet
  belongs_to :question

  validates :choice, presence: true
end

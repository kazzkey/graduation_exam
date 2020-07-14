# == Schema Information
#
# Table name: answer_sheets
#
#  id         :bigint           not null, primary key
#  point      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  exam_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_answer_sheets_on_exam_id  (exam_id)
#  index_answer_sheets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#  fk_rails_...  (user_id => users.id)
#
class AnswerSheet < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end

# == Schema Information
#
# Table name: answer_sheets
#
#  id         :bigint           not null, primary key
#  point      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  exam_id    :bigint
#  subject_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_answer_sheets_on_exam_id     (exam_id)
#  index_answer_sheets_on_subject_id  (subject_id)
#  index_answer_sheets_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#  fk_rails_...  (subject_id => subjects.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe AnswerSheet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

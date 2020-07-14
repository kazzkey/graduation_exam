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
FactoryBot.define do
  factory :answer_sheet do
    point { 1 }
    user { nil }
    exam { nil }
    subject { nil }
  end
end

# == Schema Information
#
# Table name: comments
#
#  id              :bigint           not null, primary key
#  content         :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  answer_sheet_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_comments_on_answer_sheet_id  (answer_sheet_id)
#  index_comments_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (answer_sheet_id => answer_sheets.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :comment do
    content { 'TestComment' }
    user_id { 1 }
    answer_sheet_id { 1 }
  end
end

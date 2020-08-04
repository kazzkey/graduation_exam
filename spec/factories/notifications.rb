# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action          :string           default(""), not null
#  checked         :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  answer_sheet_id :bigint
#  comment_id      :bigint
#  visited_id      :integer          not null
#  visitor_id      :integer          not null
#
# Indexes
#
#  index_notifications_on_answer_sheet_id  (answer_sheet_id)
#  index_notifications_on_comment_id       (comment_id)
#  index_notifications_on_visited_id       (visited_id)
#  index_notifications_on_visitor_id       (visitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (answer_sheet_id => answer_sheets.id)
#  fk_rails_...  (comment_id => comments.id)
#
FactoryBot.define do
  factory :notification do
    answer_sheet { nil }
    comment { nil }
    action { "MyString" }
    checked { false }
  end
end

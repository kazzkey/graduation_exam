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
class Notification < ApplicationRecord
  default_scope -> { order(id: :desc) }

  belongs_to :answer_sheet, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end

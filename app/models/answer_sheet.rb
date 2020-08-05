# == Schema Information
#
# Table name: answer_sheets
#
#  id         :bigint           not null, primary key
#  score      :integer          not null
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
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # コメント通知作成メソッド
  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(answer_sheet_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      answer_sheet_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end

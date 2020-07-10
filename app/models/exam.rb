# == Schema Information
#
# Table name: exams
#
#  id         :bigint           not null, primary key
#  deadline   :date             not null
#  release    :boolean          default(FALSE), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Exam < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validate :date_not_before_today

  def date_not_before_today
    errors.add(:deadline, "は過去の日付を選択できません") if
    deadline.nil? || deadline < Date.today
  end
end

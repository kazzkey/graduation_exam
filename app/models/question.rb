# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  content        :text             not null
#  correct_answer :integer          not null
#  description    :string
#  image          :string
#  rate           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  exam_id        :bigint
#
# Indexes
#
#  index_questions_on_exam_id  (exam_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#
class Question < ApplicationRecord
  belongs_to :exam
  has_many :answers
  mount_uploader :image, ImageUploader

  validates :content, presence: true, length: { maximum: 65535 }
  validates :correct_answer, presence: true
  validates :description, length: { maximum: 255 }
end

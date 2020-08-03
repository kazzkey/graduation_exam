# == Schema Information
#
# Table name: subjects
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Subject < ApplicationRecord
  has_many :exams

  validates :name, presence: true, length: { maximum: 255 }

  default_scope -> { order(:id) }
end

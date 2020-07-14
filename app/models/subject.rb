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
  has_many :answer_sheets

  validates :name, length: { maximum: 255 }
end

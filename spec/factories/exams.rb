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
FactoryBot.define do
  factory :exam do
    title { "Test1" }
    deadline { "2021-01-01" }
    release { false }
  end
end

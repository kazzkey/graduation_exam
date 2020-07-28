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
#  subject_id :bigint
#
# Indexes
#
#  index_exams_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#
FactoryBot.define do

  factory :exam_with_question, class: Exam do
    id { 1 }
    title { 'ExamTitle' }
    subject_id { 1 }
    deadline { '2021-01-01' }
    release { false }

    after( :create ) do |exam|
      create :question, exam: exam
    end
  end
end

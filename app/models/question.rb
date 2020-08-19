# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  content        :text             not null
#  correct_answer :integer          not null
#  description    :string
#  image          :string
#  rate           :decimal(, )
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

  # Method to calculate correct answer rate
  def self.calculate_correct_answer_rate
    @questions = self.all

    @questions.each do |question|
      if question.answers.length > 0
        parameter = question.answers.length
        num_of_correct_answers = 0

        question.answers.each do |answer|
          num_of_correct_answers += 1 if answer.choice == question.correct_answer
        end

        question.rate = num_of_correct_answers.to_f / parameter * 100
        unless question.save
          flash.now[:alert] = "正答率の更新に失敗しました"
          render :index
        end
      end
    end
  end
end

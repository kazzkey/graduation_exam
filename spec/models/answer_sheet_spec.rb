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
require 'rails_helper'

RSpec.describe AnswerSheet, type: :model do

  before do
    FactoryBot.create(:subject)
    FactoryBot.create(:user)
    FactoryBot.create(:exam_with_question)
  end

  it '解答が入力されている場合、有効である' do
    answer_sheet = AnswerSheet.new(
      exam_id: 1,
      user_id: 1,
    )
    answer = answer_sheet.answers.build(
      choice: 1,
      question_id: 1,
    )
    expect(answer_sheet).to be_valid
  end

  it '解答が入力されていない場合、無効である' do
    answer_sheet = AnswerSheet.new(
      exam_id: 1,
      user_id: 1,
    )
    answer = answer_sheet.answers.build(
      choice: nil,
      question_id: 1,
    )
    expect(answer_sheet).to be_invalid
  end
end

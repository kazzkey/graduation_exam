# == Schema Information
#
# Table name: comments
#
#  id              :bigint           not null, primary key
#  content         :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  answer_sheet_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_comments_on_answer_sheet_id  (answer_sheet_id)
#  index_comments_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (answer_sheet_id => answer_sheets.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    FactoryBot.create(:subject)
    FactoryBot.create(:user)
    FactoryBot.create(:exam_with_question, release: true)
    FactoryBot.create(:answer_sheet_with_answer)
  end

  it 'コメントが入力されている場合、有効である' do
    comment = Comment.new(
      content: 'test',
      user_id: 1,
      answer_sheet_id: 1,
    )
    expect(comment).to be_valid
  end

  it 'コメントが入力されていない場合、無効である' do
    comment = Comment.new(
      content: nil,
      user_id: 1,
      answer_sheet_id: 1,
    )
    expect(comment).to be_invalid
  end
end

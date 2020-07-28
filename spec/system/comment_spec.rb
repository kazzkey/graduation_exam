require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do

  before do
    FactoryBot.create(:subject)
    FactoryBot.create(:user)
    FactoryBot.create(:admin)
    FactoryBot.create(:exam_with_question, release: true)
    FactoryBot.create(:answer_sheet_with_answer)
  end

  describe 'コメント画面' do

    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 202020
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '自分のコメントを送信した場合' do

      before do
        visit answer_sheet_path(id: 1)
        sleep 0.5
        fill_in 'コメントを入力', with: 'TestComment'
        click_on '登録する'
      end

      it '自分のコメントがページに反映される' do
        visit answer_sheet_path(id: 1)
        expect(page).to have_content 'TestComment'
        expect(page).to have_content '山田花子'
      end

      it '自分のコメントを編集できる' do
        visit answer_sheet_path(id: 1)
        sleep 0.5
        click_link '編集'
        sleep 0.5
        first('textarea').set('ExampleComment')
        click_on '更新する'
        expect(page).to have_content 'ExampleComment'
      end

      it '自分のコメントを削除できる' do
        visit answer_sheet_path(id: 1)
        sleep 0.5
        click_link '削除'
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
        expect(page).not_to have_content 'TestComment'
      end
    end

    context '他人がコメントを送信した場合' do

      it '他人のコメントは編集・削除ができない' do
        FactoryBot.create(:comment, user_id: 2)
        visit answer_sheet_path(id: 1)
        expect(page).not_to have_content '編集'
        expect(page).not_to have_content '削除'
      end
    end

  end
end

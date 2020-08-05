require 'rails_helper'

RSpec.describe '通知機能', type: :system do

  before do
    FactoryBot.create(:subject)
    FactoryBot.create(:user)
    FactoryBot.create(:admin)
    FactoryBot.create(:exam_with_question, release: true)
    FactoryBot.create(:answer_sheet_with_answer)
  end

  describe '通知一覧画面' do

    context 'adminからコメントされた場合' do

      before do
        visit new_user_session_path
        fill_in '学籍番号', with: 1
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit teacher_answer_sheet_path(id: 1)
        sleep 0.5
        fill_in 'コメントを入力', with: 'CommentFromAdmin!'
        click_on '送信'
        click_link 'マイページ'
        click_link 'ログアウト'
        visit new_user_session_path
        fill_in '学籍番号', with: 202020
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end

      it '通知マークがトップページに表示される' do
        visit root_path
        expect(page).to have_selector '.fa-circle'
      end

      it '通知一覧に遷移するとコメントの通知が表示される' do
        visit root_path
        click_link '通知'
        expect(page).to have_content 'CommentFromAdmin!'
      end
    end
  end

  context 'adminのコメントに返信した場合' do

    before do
      FactoryBot.create(:admin_comment)
      visit new_user_session_path
      fill_in '学籍番号', with: 202020
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      visit answer_sheet_path(id: 1)
      sleep 0.5
      fill_in 'コメントを入力', with: 'Thank you!!'
      click_on '送信'
      click_link 'マイページ'
      click_link 'ログアウト'
      visit new_user_session_path
      fill_in '学籍番号', with: 1
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    it '通知マークがadminのトップページに表示される' do
      visit root_path
      expect(page).to have_selector '.fa-circle'
    end

    it '通知一覧に遷移すると返信通知が表示される' do
      visit root_path
      click_link '通知'
      expect(page).to have_content 'Thank you!!'
    end
  end
end

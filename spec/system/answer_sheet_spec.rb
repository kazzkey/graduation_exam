require 'rails_helper'

RSpec.describe '試験解答機能', type: :system do

  before do
    FactoryBot.create(:subject)
    FactoryBot.create(:user)
  end

  describe 'ホーム画面' do

    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 202020
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context 'アクセスした場合' do

      it '公開された試験情報が表示される' do
        FactoryBot.create(:exam_with_question, release: true)
        visit root_path
        sleep 0.5
        expect(page).to have_content 'ExamTitle'
        expect(page).to have_content '2021-01-01'
      end

      it '公開された試験情報なければ何も表示されない' do
        FactoryBot.create(:exam_with_question)
        visit root_path
        sleep 0.5
        expect(page).not_to have_content 'ExamTitle'
        expect(page).not_to have_content '2021-01-01'
        expect(page).to have_content '現在0件のテストがあります'
      end
    end
  end

  describe '解答画面' do

    before do
      FactoryBot.create(:exam_with_question, release: true)
      visit new_user_session_path
      fill_in '学籍番号', with: 202020
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context 'アクセスした場合' do

      it '試験情報が表示される' do
        visit root_path
        sleep 0.5
        click_on '解答'
        sleep 0.5
        expect(page).to have_content 'ExamTitle'
        expect(page).to have_content '2021-01-01'
        expect(page).to have_content 'QuestionText'
        expect(page).to have_selector('img[src$="test.jpg"]')
      end

      it '試験問題の正解は表示されない' do
        visit root_path
        sleep 0.5
        click_on '解答'
        sleep 0.5
        expect(page).not_to have_content '解答：1'
      end
    end

    context '解答を送信した場合' do

      it '結果ページに遷移する' do
        click_on '解答'
        select '③', from: 'Choice'
        click_on '登録する'
        sleep 0.5
        expect(page).to have_content '採点結果'
      end

      it '解答が正しければ1点と表示される' do
        click_on '解答'
        select '①', from: 'Choice'
        click_on '登録する'
        sleep 0.5
        expect(page).to have_content '1点'
      end

      it '解答が誤っていれば0点と表示される' do
        click_on '解答'
        select '②', from: 'Choice'
        click_on '登録する'
        sleep 0.5
        expect(page).to have_content '0点'
      end

      it '同じ問題を二度は解答できない' do
        click_on '解答'
        select '②', from: 'Choice'
        click_on '登録する'
        sleep 0.5
        visit root_path
        expect(page).to have_content '解答済'
      end
    end
  end
end

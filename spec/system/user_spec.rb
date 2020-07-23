require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do

  before do
    FactoryBot.create(:subject)
    FactoryBot.create(:user)
  end

  describe 'ユーザ詳細画面' do
    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 202020
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context 'マイページにアクセスした場合' do
      it 'ユーザ情報が表示される' do
        visit root_path
        click_link 'マイページ'
        sleep 0.5
        expect(page).to have_content '学籍番号：202020'
        expect(page).to have_content '山田花子'
        expect(page).to have_content 'yamada@example.com'
      end
    end

    context 'メールアドレスを編集した場合' do
      it '情報が更新される' do
        visit user_path
        click_link '編集'
        sleep 0.5
        fill_in 'Eメール', with: 'hanako@example.com'
        click_on '更新する'
        sleep 0.5
        expect(page).to have_content 'hanako@example.com'
      end
    end
  end
end

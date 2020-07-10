require 'rails_helper'

RSpec.describe '試験作成機能', type: :system do
  describe '試験一覧画面' do
    before do
      exam = FactoryBot.create(:exam)
    end
    context '試験を作成した場合' do
      it '作成済みの試験が表示される' do
        visit exams_path
        expect(page).to have_content 'Test1'
        expect(page).to have_content '2021-01-01'
        expect(page).to have_content 'false'
      end
    end

    context '試験を削除した場合' do
      it '削除された試験は存在しなくなる' do
        visit exams_path
        click_on 'Destroy'
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
        expect(page).not_to have_content 'Test1'
      end
    end
  end

  describe '試験作成画面' do
    context '項目をすべて入力してcreateを押した場合' do
      it 'データが保存される' do
        visit new_exam_path
        fill_in 'Title', with: 'test_title'
        fill_in 'Deadline', with: '002020-12-31'
        check 'Release'
        click_on 'create'
        sleep 0.5
        expect(page).to have_content 'test_title'
        expect(page).to have_content '2020-12-31'
        expect(page).to have_content 'true'
      end
    end

    context 'release以外の項目を入力してcreateを押した場合' do
      it '公開はfalseとしてデータが保存される' do
        visit new_exam_path
        fill_in 'Title', with: 'test_title'
        fill_in 'Deadline', with: '002020-12-31'
        click_on 'create'
        sleep 0.5
        expect(page).to have_content 'test_title'
        expect(page).to have_content '2020-12-31'
        expect(page).to have_content 'false'
      end
    end
  end

  describe '試験詳細画面' do
    context '任意の試験詳細画面にアクセスした場合' do
      it '該当の内容が表示されたページに遷移する' do
        exam = FactoryBot.create(:exam)
        visit exams_path
        click_on 'Show'
        sleep 0.5
        expect(page).to have_content 'Test1'
        expect(page).to have_content '2021-01-01'
        expect(page).to have_content 'false'
      end
    end
  end

  describe '試験編集画面' do
    context '試験の公開にチェックをした場合' do
      it '公開情報がtrueに変更される' do
        exam = FactoryBot.create(:exam)
        visit exams_path
        click_on 'Edit'
        sleep 0.5
        check 'Release'
        click_on 'create'
        sleep 0.5
        expect(page).to have_content 'true'
      end
    end
  end
end

require 'rails_helper'

RSpec.describe '試験作成機能', type: :system do
  describe '試験一覧画面' do
    context '試験を作成した場合' do
      it '作成済みの試験が表示される' do
        exam = FactoryBot.create(:exam)
        visit exams_path
        expect(page).to have_content 'Test1'
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
      it 'データが保存される' do
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
end

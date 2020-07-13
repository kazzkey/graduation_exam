require 'rails_helper'

RSpec.describe '試験作成機能', type: :system do

  before do
    FactoryBot.create(:subject)
  end

  describe '試験一覧画面' do
    before do
      exam = FactoryBot.create(:exam_with_question)
    end
    context '試験(問題は1問)を作成した場合' do
      it '作成済みの試験が表示され、子となる問題が1つ存在する' do
        visit exams_path
        expect(page).to have_content 'ExamTitle'
        expect(page).to have_content '2021-01-01'
        expect(page).to have_content '×'
        expect( Question.count ).to eq 1
      end
    end

    context '試験を削除した場合' do
      it '削除された試験は存在しなくなり、紐付けられた問題も削除される' do
        visit exams_path
        click_on 'Destroy'
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
        expect(page).not_to have_content 'ExamTitle'
        expect( Question.count ).to eq 0
      end
    end
  end

  describe '試験作成画面' do
    context '項目をすべて入力(問題は1問)してcreateを押した場合' do
      it 'データが保存される' do
        visit exams_path
        click_on 'New'
        fill_in 'Title', with: 'test_title'
        find('.subject').select('Japanese')
        fill_in 'Deadline', with: '002020-12-31'
        check 'Release'
        fill_in 'Content', with: 'QuestionContent', match: :first
        select '①', from: 'Correct answer', match: :first
        click_on 'create'
        sleep 0.5
        expect(page).to have_content 'test_title'
        expect(page).to have_content '2020-12-31'
        expect(page).to have_content '○'
        click_on 'Show'
        sleep 0.5
        expect(page).to have_content 'QuestionContent'
        expect(page).to have_content '1'
      end
    end
  end

  describe '試験詳細画面' do
    context '任意の試験詳細画面にアクセスした場合' do
      it '該当の内容が表示されたページに遷移する' do
        exam = FactoryBot.create(:exam_with_question)
        visit exams_path
        click_on 'Show'
        sleep 0.5
        expect(page).to have_content 'ExamTitle'
        expect(page).to have_content 'Japanese'
        expect(page).to have_content '2021-01-01'
        expect(page).to have_content '×'
        expect(page).to have_content 'QuestionText'
        expect(page).to have_content '1'
      end
    end
  end

  describe '試験編集画面' do
    context '試験の公開にチェックをした場合' do
      it '公開情報がtrueに変更される' do
        exam = FactoryBot.create(:exam_with_question)
        visit exams_path
        click_on 'Edit'
        sleep 0.5
        check 'Release'
        click_on 'create'
        sleep 0.5
        expect(page).to have_content '○'
      end
    end
  end
end

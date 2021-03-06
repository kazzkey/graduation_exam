require 'rails_helper'

RSpec.describe '試験作成機能', type: :system do

  before do
    FactoryBot.create(:subject)
    FactoryBot.create(:admin)
  end

  describe '試験一覧画面' do
    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 1
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      exam = FactoryBot.create(:exam_with_question)
    end

    context '試験(問題は1問)を作成した場合' do
      it '作成済みの試験が表示され、子となる問題が1つ存在する' do
        visit exams_path
        expect(page).to have_content 'ExamTitle'
        expect(page).to have_content '2021年01月01日(金)'
        expect(page).to have_content '非公開'
        expect( Question.count ).to eq 1
      end
    end
  end

  describe '試験作成画面' do
    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 1
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '項目をすべて入力して作成した場合(画像は1問目のみとする)' do
      before do
        visit exams_path
        click_on '新規作成'
        fill_in '試験名', with: 'test_title'
        find('.subject').select('Japanese')
        fill_in '締切', with: Date.current
        check '公開'
        find('.image_form_1', visible: false, match: :first).set("#{Rails.root}/spec/factories/test.jpg")
        for n in 0..4 do
          all('textarea')[n].set("QuestionContent#{n}")
          # selectの最初の要素が教科の選択なので、それを除くため"n+1"としている。
          all('select')[n + 1].find("option[value='1']").select_option
        end
        click_on '送信'
      end

      it 'データが保存されている' do
        visit exams_path
        expect(page).to have_content 'test_title'
        expect(page).to have_content I18n.l Date.current, format: :long
        expect(page).to have_content '公開'
      end

      it '詳細ページには問題情報も表示される' do
        visit exams_path
        find('.fa-file-alt').click
        sleep 0.5
        expect(page).to have_selector('img[src$="test.jpg"]')
        expect(page).to have_content 'QuestionContent'
        expect(page).to have_content '正解:1'
      end
    end
  end

  describe '試験詳細画面' do
    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 1
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '任意の試験詳細画面にアクセスした場合' do
      it '該当の内容が表示されたページに遷移する' do
        exam = FactoryBot.create(:exam_with_question)
        visit exams_path
        find('.fa-file-alt').click
        sleep 0.5
        expect(page).to have_content 'ExamTitle'
        expect(page).to have_content 'Japanese'
        expect(page).to have_content '2021/01/01'
        expect(page).to have_content '×'
        expect(page).to have_selector('img[src$="test.jpg"]')
        expect(page).to have_content 'QuestionText'
        expect(page).to have_content '正解:1'
      end
    end
  end

  describe '試験編集画面' do
    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 1
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '試験の公開にチェックをした場合' do
      it '公開情報がtrueに変更される' do
        exam = FactoryBot.create(:exam_with_question)
        visit exams_path
        find('.fa-edit').click
        sleep 0.5
        check '公開'
        fill_in '締切', with: '002020-12-31'
        click_on '更新'
        sleep 0.5
        expect(page).to have_content '公開'
      end
    end
  end

  describe '試験削除画面' do
    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 1
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      exam = FactoryBot.create(:exam_with_question)
    end

    context 'まだ解答されていない試験だった場合' do
      it '削除された試験は存在しなくなり、紐付けられた問題も削除される' do
        visit exams_path
        find('.fa-trash-alt').click
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
        expect(page).not_to have_content 'ExamTitle'
        expect( Question.count ).to eq 0
      end
    end

    context 'すでに解答されている試験だった場合' do
      before do
        FactoryBot.create(:user)
        FactoryBot.create(:answer_sheet_with_answer)
      end

      it '試験は削除できない' do
        visit exams_path
        find('.fa-trash-alt').click
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
        expect(page).to have_content 'ExamTitle'
        expect( Question.count ).to eq 1
        expect(page).to have_content 'すでに解答されている試験は削除できません'
      end
    end
  end

  describe '復習試験作成画面' do
    before do
      visit new_user_session_path
      fill_in '学籍番号', with: 1
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      FactoryBot.create(:exam)
      for n in 1..5 do
        FactoryBot.create(:question, id: n, content: "Content#{n}")
      end
    end

    context '試験を作成した場合' do
      before do
        visit exams_path
        click_on '復習問題'
        fill_in '試験名', with: 'REtest_title'
        find('.subject').select('Japanese')
        fill_in '締切', with: Date.current
        check '公開'
        click_on '問題選択'
        for n in 0..4 do
          all('.q-check')[n].set(true)
        end
        click_on 'Close', match: :first
        sleep 0.5
        click_on '送信'
      end

      it 'データが保存されている' do
        visit exams_path
        expect(page).to have_content 'REtest_title'
        expect(page).to have_content I18n.l Date.current, format: :long
        expect(page).to have_content '公開'
      end

      it '詳細ページには問題が5問表示されている' do
        visit exams_path
        all('.fa-file-alt')[0].click
        sleep 0.5
        expect(page).to have_content 'Content1'
        expect(page).to have_content 'Content2'
        expect(page).to have_content 'Content3'
        expect(page).to have_content 'Content4'
        expect(page).to have_content 'Content5'
      end
    end
  end
end

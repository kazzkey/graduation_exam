class AnswerSheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer_sheet

  def new
    @answer_sheet = current_user.answer_sheets.build
    @answer = @answer_sheet.answers.build
  end

  def create
    @answer_sheet = current_user.answer_sheets.build(answer_sheet_params)
    point_check
    if @answer_sheet.save
      redirect_to result_exam_answer_sheet_path(id: @answer_sheet.id)
    else
      render :new
    end
  end

  def result
    @answer_sheet = AnswerSheet.find(params[:id])
  end


  private
  def set_answer_sheet
    @exam = Exam.find(params[:exam_id])
  end

  def answer_sheet_params
    params.require(:answer_sheet)
          .permit(answers_attributes: %i[id _destroy choice answer_sheet_id question_id])
          .merge(exam_id: params[:exam_id])
  end

  def point_check
    @answer_sheet.point = 0

    i = 0
    while i < @exam.questions.length do
      question = Question.find(params[:answer_sheet][:answers_attributes][i.to_s][:question_id])
      if question.correct_answer == params[:answer_sheet][:answers_attributes][i.to_s][:choice].to_i
        @answer_sheet.point += 1
      end
      i += 1
    end
  end
end

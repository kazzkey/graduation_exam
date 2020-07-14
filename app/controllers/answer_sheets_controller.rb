class AnswerSheetsController < ApplicationController
  before_action :set_answer_sheet

  def new
    @answer_sheet = current_user.answer_sheets.build
  end

  def create
    @answer_sheet = current_user.answer_sheets.build(answer_sheet_params)
  end

  def result
    @answer_sheet = AnswerSheet.find(params[:id])
  end


  private
  def set_answer_sheet
    @exam = Exam.find(params[:exam_id])
  end

  def answer_sheet_params
    params.require(:answer_sheet).merge(exam_id: params[:exam_id])
  end
end

class Teacher::AnswerSheetsController < ApplicationController
  before_action :authenticate_admin
  before_action :set_answer_sheet, only: %i(show result)

  def index
    @q = AnswerSheet.order(id: :desc).ransack(params[:q])
    @answer_sheets = @q.result.includes(:exam)
  end

  def result; end

  def show
    @comments = @answer_sheet.comments.where(answer_sheet_id: @answer_sheet.id)
    @comment = current_user.comments.build
  end


  private
  def set_answer_sheet
    @answer_sheet = AnswerSheet.find(params[:id])
  end
end

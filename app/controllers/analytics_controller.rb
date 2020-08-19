class AnalyticsController < ApplicationController
  before_action :authenticate_admin

  def index
    @q = Question.select(:id, :exam_id, :content, :rate)
                 .order(:id).ransack(params[:q])
    @questions = @q.result.includes(:exams, :exam_questions)

  end

  def calculate
    Question.calculate_correct_answer_rate
    redirect_to analytics_path, notice: "正答率を更新しました"
  end
end

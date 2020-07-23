class UsersController < ApplicationController
  def show
    @user = current_user

    # 得点のグラフ表示
    @answer_sheets = AnswerSheet.where(user_id: current_user.id).order(:id)
    @point_charts = []
    @answer_sheets.each do |as|
      point_chart = [as.exam.title, as.point]
      @point_charts << point_chart
    end

    # 平均点のグラフ表示
    @average = AnswerSheet.group(:exam_id).average(:point).sort.to_h
    @average_charts = []
    @average.values.each_with_index do |value, i|
      exam = Exam.find(i + 1)
      average_chart = [exam.title, value]
      @average_charts << average_chart
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end

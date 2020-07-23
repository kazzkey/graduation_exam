class UsersController < ApplicationController
  def show
    @user = current_user

    @answer_sheets = AnswerSheet.where(user_id: current_user.id).order(:id)
    @point_charts = []
    @answer_sheets.each do |as|
      point_chart = [as.exam.title, as.point]
      @point_charts << point_chart
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

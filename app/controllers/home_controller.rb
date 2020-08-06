class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # 締切の過ぎた問題をはじく
    @exams = Exam.where(release: true).where("deadline >= ?", Date.current).order(:id)
    # 締切3日以内の試験を取り出す
    @exams_on_deadline = @exams.where("deadline <= ?", Date.current + 3)
  end
end

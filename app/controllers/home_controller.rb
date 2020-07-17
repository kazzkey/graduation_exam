class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @exams = Exam.where(release: true).where("deadline > ?", Date.current)
  end
end

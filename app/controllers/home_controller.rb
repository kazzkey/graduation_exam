class HomeController < ApplicationController
  def index
    @exams = Exam.where(release: true)
  end
end

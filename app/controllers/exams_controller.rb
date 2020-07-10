class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to exams_path
    else
      render :new
    end
  end

  private
  def exam_params
    params.require(:exam).permit %i(title deadline release)
  end
end

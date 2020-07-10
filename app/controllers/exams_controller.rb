class ExamsController < ApplicationController
  before_action :set_exam, only: %i(show edit update destroy)

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

  def show; end

  def edit; end

  def update
    @exam.update(exam_params)
    if @exam.save
      redirect_to exams_path
    else
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_path
  end

  private

  def set_exam
    @exam = Exam.find(params[:id])
  end
  def exam_params
    params.require(:exam).permit %i(title deadline release)
  end
end

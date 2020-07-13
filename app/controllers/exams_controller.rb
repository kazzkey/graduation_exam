class ExamsController < ApplicationController
  before_action :set_exam, only: %i(show edit update destroy)

  def index
    @exams = Exam.order(:id)
  end

  def new
    @exam = Exam.new
    5.times { @exam.questions.build }
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
    params.require(:exam).permit(:title, :deadline, :release, :subject_id,
                                    questions_attributes:
                                    %i[id _destroy image content correct_answer description exam_id]
                                   )
  end
end

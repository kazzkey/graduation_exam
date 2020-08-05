class ExamsController < ApplicationController
  before_action :authenticate_admin
  before_action :set_exam, only: %i(show edit update destroy)

  def index
    @exams = Exam.order(id: :desc)
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
      flash.now[:alert] = t("views.messages.failed_to_create")
      5.times { @exam.questions.build }
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
      flash.now[:alert] = t("views.messages.failed_to_update")
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_path, notice: t("views.messages.deleted")
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

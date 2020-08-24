class ExamsController < ApplicationController
  before_action :authenticate_admin
  before_action :set_exam, only: %i(show edit update destroy)

  def index
    @q = Exam.ransack(params[:q])
    @exams = @q.result(distinct: true)
  end

  def new
    @exam = Exam.new
    5.times { @exam.questions.build }
  end

  def renew
    @exam = Exam.new
    @questions = Question.order(:id).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @exam = Exam.new(exam_params)
    @path = Rails.application.routes.recognize_path(request.referer)

    if @exam.save
      redirect_to exams_path
    else
      flash.now[:alert] = t("views.messages.failed_to_create")

      case @path[:action]
      when "new"
        render :new
      when "renew"
        render :renew
      end
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
    params.require(:exam).permit(:title, :deadline, :release, :subject_id, { question_ids: [] },
                                    questions_attributes:
                                    %i[id _destroy image content correct_answer description exam_id]
                                   )
  end
end

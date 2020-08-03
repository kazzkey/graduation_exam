class SubjectsController < ApplicationController
  before_action :authenticate_admin
  before_action :load_subjects
  before_action :set_subject, only: %i(edit update destroy)

  def index
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.js { render :index }
      else
        format.html { redirect_to subjects_path, alert: t("views.messages.failed_to_create") }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.js { render :index }
      else
        flash.now[:alert] = t("views.messages.failed_to_update")
        format.js { render :edit }
      end
    end
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      flash.now[:notice] = t("views.messages.deleted")
      format.js { render :index }
    end
  end

  private
  def load_subjects
    @subjects = Subject.all
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end

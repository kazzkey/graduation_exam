class CommentsController < ApplicationController
  before_action :set_answer_sheet, only: %i(create edit update)

  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to answer_sheet_path(@answer_sheet),
                      alert: t("views.messages.failed_to_comment")
                    }
      end
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def update
    @comment = current_user.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          format.js { render :index }
        else
          flash.now[:alert] = t("views.messages.failed_to_update_comment")
          format.js { render :edit }
        end
      end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = t("views.messages.delete_comment")
      format.js { render :index }
    end
  end

  private

  def set_answer_sheet
    @answer_sheet = AnswerSheet.find(params[:answer_sheet_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(answer_sheet_id: params[:answer_sheet_id])
  end
end

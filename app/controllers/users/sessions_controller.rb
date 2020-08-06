# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def guest_student
    user = User.student
    sign_in user
    redirect_to root_path, notice: 'ゲスト太郎(生徒)としてログインしとるけぇ'
  end

  def guest_teacher
    user = User.teacher
    sign_in user
    redirect_to teacher_root_path, notice: 'ゲスト先生(教員)としてログインしとるけぇ'
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

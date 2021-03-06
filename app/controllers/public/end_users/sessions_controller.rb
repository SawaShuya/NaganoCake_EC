# frozen_string_literal: true

class Public::EndUsers::SessionsController < Devise::SessionsController
  layout "public"
  before_action :reject_user, only: [:create]
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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def reject_user
    @my_data = EndUser.find_by(email: params[:end_user][:email])

    if @my_data.active_for_authentication? == false
      flash[:notice] = "already unsubsucribe"
      redirect_to new_end_user_session_path
    end

  end
end

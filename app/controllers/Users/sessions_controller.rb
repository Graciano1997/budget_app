class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super do |resource|
      redirect_to groups_path and return if resource.persisted?
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  # In your controller action, e.g., SessionsController#destroy
  def destroy
    sign_out(current_user) # This method is provided by Devise
    redirect_to root_path, notice: 'Logged out successfully.'
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

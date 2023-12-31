class ApplicationController < ActionController::Base
  # アクセス制限
  before_action :configure_permitted_parameters, if: :devise_controller?

  # フラッシュメッセージのbootstrap
  add_flash_types :secondary, :success, :danger, :warning, :info, :light, :dark

  protected

  # サインアップ時にnameも許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

# deviseログインを手動で別ページに遷移させるメソッド
# def after_sign_in_path_for(resource)
#   your_desired_path # 例: dashboard_path
# end
class ApplicationController < ActionController::Base
end

# deviseログインを手動で別ページに遷移させるメソッド
# def after_sign_in_path_for(resource)
#   your_desired_path # 例: dashboard_path
# end
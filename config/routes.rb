Rails.application.routes.draw do

  devise_for :users
  # 管理者用
  # URL /admin/sign_in ...
  # Webページに表示されるものを制限かける
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end

Rails.application.routes.draw do

  # ユーザー用
  # URL /customers/sign_in ...（URLが自動で変更してくれる）
  # Webページに表示されるものを制限かける
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end

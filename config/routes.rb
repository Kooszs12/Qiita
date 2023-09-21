Rails.application.routes.draw do

  # ユーザー用
  # URL /customers/sign_in ...（URLが自動で変更してくれる）
  # Webページに表示されるものを制限かける
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # devise生成したコントローラーに手動でアクションを追加した時は、devise_scopeの中に追記
  devise_scope :user do
    # ゲストサインイン
    post "user/guest_sign_in", to: "user/sessions#guest_sign_in"
  end

  # ユーザー側
  scope module: :user do
    root "homes#top"
    # マイページ
    get 'users/mypage/:id' => 'users#show', as: :users_mypage
    # 退会確認ページ
    get 'users/confirm_withdraw' => 'users#confirm_withdraw', as: :users_confirm_withdraw
    # 退会機能
    patch 'users/withdraw' => 'users#withdraw'
    end

  # admin側
  namespace :admin do
    get "/" => "homes#top"
  end

end

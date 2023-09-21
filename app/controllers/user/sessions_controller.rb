# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # ユーザーcreate前にreject_userを呼び出す
  before_action :reject_user, only: [:create]

  # ゲストサインイン
  def guest_sign_in
    # ゲストユーザーを作成
    user = User.guest
    # ログイン
    sign_in user
    redirect_to root_path, notice: "guestuserでログインしました。"
  end

  protected

  # 退会済みのユーザーがログインできないようにする（退会処理とは別）
  def reject_user
    @user = User.find_by(email: params[:user][:email])
    # 存在しているかどうか分岐
    if @user
      # 退会フラグが退会済みか有効化判断
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_user_registration_path
      end
    else
      # そもそも存在していなかった場合
      flash[:notice] = "該当するユーザーが見つかりません"
    end
  end

end

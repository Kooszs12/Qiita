class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # 退会確認
  def confirm_withdraw
    # ログインしているユーザー本人のデータ
    @user = current_user
  end

  # 退会
  def withdraw
    # ログインしているユーザー本人のデータ
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    # "#{}で文字列の中に変数を入れられる"
    @user.update(is_deleted: true, name: "退会済み")
    # byebug
    # 退会した時点でログアウトする
    reset_session
    # 成功メッセージ
    redirect_to root_path, info: "ご利用ありがとうございました"
  end

end

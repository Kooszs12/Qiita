class Admin::PlacesController < ApplicationController

  # アクセス制限
  before_action :authenticate_admin!

  def new
    @place = Place.new
  end

  def create
    # 許可されたデータが変数に格納
    @place = Place.new(place_params)
    # 保存が成功した場合
    if @place.save
      # フラッシュメッセージを表示して寺社詳細ページへ遷移
      redirect_to admin_place_path(@place), info: "投稿されました"
    # それ以外の場合（失敗した場合）
    else
      # 寺社新規投稿ページへ遷移
      render :new
    end
  end

  def index
    @places = Place.all
  end

  def show
    # 特定の寺社データ格納
    @place = Place.find(params[:id])
  end

  def edit
    # 特定の寺社のデータを格納
    @place = Place.find(params[:id])
  end

  # 更新機能
  def update
    # 特定の寺社データを格納
    @place = Place.find(params[:id])
    # 更新に成功したら
    if @place.update(place_params)
      # 更新された寺社詳細ページへ遷移
      redirect_to admin_place_path(@place), info: "編集されました"
    else
      # 失敗した寺社編集ページへ遷移
      render :edit
    end
  end

  def destroy
  end

  private

  def place_params
    params.require(:place).permit(
    :prefecture_id,
    :user_id,
    :admin_id,
    :category,
    :name,
    :address,
    :postcode,
    :phone_number,
    :got,
    :sect,
    :pet,
    :fee,
    :start_time,
    :end_time,
    image: []
    # 前の結果に対して、付け加える
    ).merge(
        # ユーザーIDが存在するかどうか判断。存在しなかった場合nil
        user_id: user_signed_in? ? current_user.id : nil,
        # アドミンIDが存在するかどうか判断。存在しなかった場合nil
        admin_id: admin_signed_in? ? current_admin.id : nil
      )
  end

end

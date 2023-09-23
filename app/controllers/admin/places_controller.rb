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
      redirect_to admin_places_path(@place), info: "投稿されました"
    # それ以外の場合（失敗した場合）
    else
      # 寺社新規投稿ページへ遷移
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
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
    :image,
    :fee,
    :start_time,
    :end_time
    ).merge(
        # ユーザーIDが存在するかどうか判断。存在しなかった場合nil
        user_id: user_signed_in? ? current_user.id : nil,
        # アドミンIDが存在するかどうか判断。存在しなかった場合nil
        admin_id: admin_signed_in? ? current_admin.id : nil
      )
  end

end

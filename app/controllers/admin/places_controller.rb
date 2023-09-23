class Admin::PlacesController < ApplicationController

  # アクセス制限
  before_action :authenticate_admin!

  def new
  end

  def create
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
    )
  end

end

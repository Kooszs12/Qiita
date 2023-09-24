class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  # 寺社に対するアソシエーション（adminモデルが１の１：N)
  # has_many :places, dependent: :destroy

end

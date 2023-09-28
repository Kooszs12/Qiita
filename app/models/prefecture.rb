# 都道府県モデル
class Prefecture < ApplicationRecord

  #バリデーション設定
  validates :name, presence: true

  #アソシエーション
  # 地方に対してのアソシエーション（都道府県がNの１：N）
  belongs_to :area
  # 寺社に対するアソシエーション（都道府県が１の１：N)
  has_many :places, dependent: :destroy

end

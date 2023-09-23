# 寺社モデル
class Place < ApplicationRecord

  #バリデーション設定
  # カテゴリーラジオボタンバリデーション
  validates :category, presence: true
  # 寺社名バリデーション
  validates :name, presence: true, length: { maximum: 30 }
  # 郵便番号ハイフンなしバリデーション（７桁）
  validates :postcode, { with: /\A\d{7}\z/ }
  # 住所バリデーション
  validates :address, presence: true, length: { maximum: 80 }
  # ペット状況ラジオボタンバリデーション
  validates :pet, presence: true

  #アソシエーション
  # 都道府県とのアソシエーション（寺社モデルがNの１：N）
  belongs_to :prefecture
  # ユーザーとのアソシエーション
  belongs_to :user
  # adminとのアソシエーション
  belongs_to :admin

end

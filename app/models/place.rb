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
  
  #enum設定
  # 寺社（shrine: 神社　temple: お寺）
  enum category: { shrine: 0, temple: 1 }
  # ペット入場（ok: OK, ng: NG, not_clea: 不明）
  enum pet_status: { not_clea: 0, ok: 1, ng: 2 }

end

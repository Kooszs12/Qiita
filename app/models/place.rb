# 寺社モデル
class Place < ApplicationRecord

  #バリデーション設定
  # カテゴリーラジオボタンバリデーション
  validates :category, presence: true
  # 寺社名バリデーション
  validates :name, presence: true, length: { maximum: 30 }
  # 郵便番号ハイフンなしバリデーション（７桁：半角数字のみ）
  validates :postcode, format: { with: /\A[0-9]{7}\z/ }
  # 住所バリデーション
  validates :address, presence: true, length: { maximum: 80 }
  # 電話番号：空でも許可して、フォームに入力された場合は半角数字のみ許可するバリデーション
  validates :phone_number, allow_blank: true, format: { with: /\A[0-9]+\z/ }
  # 拝観料のバリデーション
  # 0〜9,999,999までの数字範囲指定
  validates :fee, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                  # フォームに入力する数字は半角数字のみ
                  format: { with: /\A[0-9]+\z/ }
  validates :sect, length: { maximum: 30 }
  # ペット状況ラジオボタンバリデーション
  validates :pet, presence: true

  validates :images, limit: { min: 0, max: 3 }

  #アソシエーション
  # 都道府県とのアソシエーション（寺社モデルがNの１：N）
  belongs_to :prefecture

  #enum設定
  # 寺社（shrine: 神社　temple: お寺）
  enum category: { shrine: 0, temple: 1 }
  # ペット入場（ok: OK, ng: NG, not_clea: 不明）
  enum pet: { not_clea: 0, ok: 1, ng: 2 }

  # imageカラム
  # has_one_attached :image 単数投稿
  # 複数投稿
  has_many_attached :images

  # No_imageが存在するかどうか判断するメソッド
  def get_place_image
    # 存在しなかった場合no_image.pngを使用
    (images.attached?) ? images : 'place_no_image.png'
  end

end

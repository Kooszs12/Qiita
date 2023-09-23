# ユーザーモデル
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #バリデーション設定
  # ユーザーネームは30文字で同名はNG(レイアウトの問題ならばCSSで適用した方がいい)
  validates :name, presence: true, length: { maximum: 30 }

  # アソシエーション
  # 寺社に対するアソシエーション（ユーザーモデルが１の１：N)
  has_many :places, dependent: :destroy

  #画像カラム
  has_one_attached :image

  # 定数にメールアドレスを格納
  GUEST_USER_EMAIL = "guest@example.com"

  # self:インスタンスを作成しなくてもメソッドが呼び出せる（クラスメソッドという）
  # IDを必要としない場合にselfを使用するみたいな雰囲気
  def self.guest
    # メールアドレスが存在するか判断（存在しない場合はcreate）
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      # assign_attributesで足りない情報を補完する(null: falseの設定があるカラム)
      user.assign_attributes(
        password: SecureRandom.urlsafe_base64,
        name: "guestuser"
      )
    end
  end

end

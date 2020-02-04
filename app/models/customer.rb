class Customer < ApplicationRecord
	has_many :addresses
	has_many :cart_items
	has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を漢字、ひらがな、カタカナで入力してください" }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を漢字、ひらがな、カタカナで入力してください"}
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "をカタカナで入力してください"}
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "をカタカナで入力してください"}
  validates :postal_code, format: { with: /\A[0-9０-９]+\z/,  message: "を数値で入力してください"}
  validates :address, presence: true
  validates :tel, format: { with: /\A[0-9０-９]+\z/, message: "を数値で入力してください"} 
  # validates :customer_status, inclusion: {in: [true, false]}
  def active_for_authentication?
    super && customer_status?
  end
  def inactive_message
    customer_status? ? super : :with_draw
  end
end
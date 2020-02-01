class Customer < ApplicationRecord
	has_many :addresses
	has_many :cart_items
	has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tel, presence: true
  # validates :customer_status, inclusion: {in: [true, false]}
  def active_for_authentication?
    super && customer_status?
  end
  def inactive_message
    customer_status? ? super : :with_draw
  end
end
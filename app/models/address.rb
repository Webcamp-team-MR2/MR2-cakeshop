class Address < ApplicationRecord
	belongs_to :customer

	validates :postal_code, presence: true
  validates :address, presence: true
  validates :full_name, presence: true
end

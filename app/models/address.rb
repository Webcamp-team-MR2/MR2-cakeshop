class Address < ApplicationRecord
	belongs_to :customer

	validates :postal_code, format: { with: /\A[0-9０-９]+\z/}
  validates :address, presence: true
  validates :full_name, presence: true
end

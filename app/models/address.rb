class Address < ApplicationRecord
	belongs_to :customer

	def postal_code_address_full_name
		self.postal_code + " " + self.address+ " " + self.full_name
	end

	validates :postal_code, format: { with: /\A[0-9０-９]+\z/}
  validates :address, presence: true
  validates :full_name, presence: true

end

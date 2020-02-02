class Address < ApplicationRecord
	belongs_to :customer
	def postal_code_address_full_name
		self.postal_code + " " + self.address+ " " + self.full_name
	end
end

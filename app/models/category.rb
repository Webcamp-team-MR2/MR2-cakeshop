class Category < ApplicationRecord
	has_many :items
    validates :sweets_name, presence: true
	validates :category_status, presence: true
end

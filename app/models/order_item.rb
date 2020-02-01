class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order
	enum create_status: {
		ipossible:0,
		wait:     1,
		create:   2,
		completed:3
	}, _prefix: true #接尾辞
end

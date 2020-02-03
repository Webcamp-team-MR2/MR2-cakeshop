class Order < ApplicationRecord
	has_many :order_items
	belongs_to :customer

	enum order_status: {
		wait:         0,
		verification: 1,
		creating:     2,
		shipping:     3,
		shipped:      4,
	}, _prefix: true #接尾辞

	enum pay_method: {
		credit:         0,
		bank:           1,
	}, _prefix: true #接尾辞
end

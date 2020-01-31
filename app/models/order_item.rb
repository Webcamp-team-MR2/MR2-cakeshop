class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order
	# enum order_status: {"入金待ち":0,"入金確認":1,"発送準備":2,"発送完了":3}
	enum order_status: { wait: 0, konf: 1, pri: 2, comp: 3}
end

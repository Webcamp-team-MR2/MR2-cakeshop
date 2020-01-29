# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category.create!(
#   [
#     {
#       sweets_name: 'cake',
#       category_status: '0',
#     }
#   ]

# Item.create!(
#   [
#     {
#       image_id: '',
#       price: '1100',
#       name: 'いちごのショートケーキ',
#       category_id: '56',
#     },
#     {
#       image_id: '',
#       price: '330',
#       name: 'チーズタルト',
#       category_id: '55',
#     }
#   ]
# )
# )
Order.create!(
 [
  {
   customer_id: '1',
   postal_code:'1980024',
   address:'japan,tokyo',
   full_name: 'shun yamashiro',
   order_status: '0',
   pay_method: '0',
   shipping_fee:'0',
  }
 ]
)
 OrderItem.create!(
  [
   {
    order_id: '2',
    item_id:'1',
    price:'5000',
    count: '2',
    create_status: '0',
   },
   {
    order_id: '2',
    item_id:'1',
    price:'2000',
    count: '4',
    create_status: '0',
   },
   {
    order_id: '2',
    item_id:'1',
    price:'15000',
    count: '20',
    create_status: '0',
   }
  ]
 )

















CartItem.create!(
  [
    # {
    #   item_id: '1',
    #   customer_id: '1',
    #   count: '1',
    # },
    {
      item_id: '2',
      customer_id: '1',
      count: '2',
    }
  ]
)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
  [
    {
      sweets_name: 'cake',
      category_status: "0"
    },
    {
      sweets_name: 'candy',
      category_status: "0"
    },
    {
      sweets_name: 'cookie',
      category_status: "0"
    }
  ]
)
Item.create!(
  [
    }
  ]
)
Order.create!(
  [
    {
      customer_id: '1',
      postal_code: "www",
      address: "ddd",
      full_name: "eee",
      order_status: "0",
      pay_method: "0",
      shipping_fee: "800"
    }
  ]
)
OrderItem.create!(
  [
    {
      order_id: '1',
      item_id: "1",
      price: "800",
      count: "2",
      create_status: "0",
    {
      order_id: '1',
      item_id: "2",
      price: "300",
      count: "1",
      create_status: "0",
    },
    {
      order_id: '1',
      item_id: "3",
      price: "500",
      count: "5",
      create_status: "0",
    }
  ]
)
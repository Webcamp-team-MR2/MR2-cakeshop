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
            sweets_name: 'game'
        }  
    ]
)
Category.create!(
  [
    {
      sweets_name: 'cake',
    }
  ]
)
Item.create!(
  [
    {
      image_id: '',
      price: '1100',
      name: 'いちごのショートケーキ',
      category_id: '1',
    },
    {
      image_id: '',
      price: '330',
      name: 'チーズタルト',
      category_id: '1',
    }
  ]
)

CartItem.create!(
  [
    {
      item_id: '1',
      customer_id: '1',
      count: '1',
    }
  ]
)







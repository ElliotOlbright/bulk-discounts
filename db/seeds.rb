# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Discount.destroy_all 

Discount.create!(name: '20% Off', discount: 0.2, quantity: 10, merchant_id: 1)
Discount.create!(name: '25% Off', discount: 0.25, quantity: 15, merchant_id: 1)
Discount.create!(name: '30% Off', discount: 0.3, quantity: 30, merchant_id: 1)
Discount.create!(name: '50% Off', discount: 0.5, quantity: 35, merchant_id: 1)

Discount.create!(name: '20% Off', discount: 0.2, quantity: 10, merchant_id: 2)
Discount.create!(name: '25% Off', discount: 0.25, quantity: 15, merchant_id: 2)
Discount.create!(name: '30% Off', discount: 0.3, quantity: 30, merchant_id: 2)
Discount.create!(name: '50% Off', discount: 0.5, quantity: 35, merchant_id: 2)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Order.delete_all

Order.populate 5 do |order|
  order.product = Faker::Commerce.product_name
  order.price = [4.99, 19.95, 100]
  order.created_at = 2.years.ago..Time.now
  order.paid = [0, 1]
end

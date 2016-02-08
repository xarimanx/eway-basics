FactoryGirl.define do
  factory :order do
    product { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
  end
end
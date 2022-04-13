FactoryBot.define do
  factory :order_delivery do
    postcode      { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    block         { Faker::Address.street_address }
    building      { Faker::Lorem.sentence }
    phone_number  { Faker::Number.number(digits: 11) }
  end
end
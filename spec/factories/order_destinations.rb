FactoryBot.define do
  factory :order_destination do
    post_code     { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { 'ハイツ' }
    phone_num { '1234567890' }
  end
end

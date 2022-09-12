FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    text { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 1, to: 10) }
    status_id { Faker::Number.between(from: 1, to: 6) }
    delivery_charge_id { Faker::Number.between(from: 1, to: 2) }
    sender_id { Faker::Number.between(from: 1, to: 47) }
    shippedd_date_id { Faker::Number.between(from: 1, to: 3) }
  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

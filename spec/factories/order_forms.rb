FactoryBot.define do
  factory :order_form do


      zip_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
      ship_from_id { Faker::Number.between(from: 1, to: 47) }
      city { Faker::Address.city }
      street_number { Faker::Address.street_address }
      name_of_building { Faker::Address.street_address }
      telephone_number { Faker::Number.decimal_part(digits: 11) }
      token { Faker::Internet.password(min_length: 20, max_length: 30) }

  end
end

FactoryBot.define do
  factory :item do
    item_name                       {Faker::Name.initials(number: 2)}
    description                     {"商品説明"}
    category_id                        {2}
    condition_id                       {3}
    shipping_fee_id                    {2}
    ship_from_id                       {3}
    shipping_date_id                   {3}
    price                           {1000}

 association :user  # User レコードと関連付け

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
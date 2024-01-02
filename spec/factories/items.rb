FactoryBot.define do
  factory :item do
    item_name                       {Faker::Name.initials(number: 2)}
    description                     {"商品説明"}
    category                        {"カテゴリー"}
    condition                       {"コンディション"}
    shipping_fee                    {"配送料"}
    ship_from                       {"発送地"}
    shipping_date                   {"発送までの日数"}
    price                           {"金額"}

    association :user  # User レコードと関連付け

    #after(:build) do |message|
      #message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    #end

  end
end
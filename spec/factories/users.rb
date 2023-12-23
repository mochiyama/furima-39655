FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.email}
    password                {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    birth_day               {Faker::Date.birthday}

    last_name_kanji         {'降間'}
    first_name_kanji        {'野郎'}
    last_name_kana          {'フリマ'}
    first_name_kana         {'ヤロウ'}

  end
end
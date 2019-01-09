FactoryGirl.define do

  factory :user do
    sequence(:nickname)              { Faker::Internet.username(6..12) }
    sequence(:email)                 { Faker::Internet.email }
    password                         { Faker::Internet.password(8) }
    password_confirmation            { "#{password}" }
    sequence(:family_name)           { Faker::Name.last_name }
    sequence(:first_name)            { Faker::Name.first_name }
    family_name_kana                  "アイウエオ"
    first_name_kana                   "カキクケコ"
    sequence(:birth_year)            { rand(2019)  }
    sequence(:birth_month)           { rand(1..12) }
    sequence(:birth_day)             { rand(1..28) }
    phone_number                      "12345678"
    avatar                            "www.jpg"
    introduction                      "おはようございます！！"

    # after(:create) do |user|
    #   create_list(:item, 2, user: user)
    # end
  end

end

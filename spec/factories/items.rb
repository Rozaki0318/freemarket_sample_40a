FactoryGirl.define do

  factory :category do
    name { Faker::Name.name }
    depth "2"
    size_pulldown "1"
  end

  factory :brand do
    name "アディダス"
  end

  factory :size do
    name "s"
    parent "1"
  end

  factory :item do
    name "jacket"
    description "abcabcabc"
    price 3000
    condition 1
    shipping_from 1
    shipping_date 1
    shipping_fee 1
    shipping_way 1
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    user
    category
    size
    brand
  end
end

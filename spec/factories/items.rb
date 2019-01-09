FactoryGirl.define do

  factory :item do
    name            "大きい帽子"
    description     "とっても大きい帽子買いませんか？"
    price           300
    condition       1
    shipping_from   1
    shipping_date   1
    shipping_fee    1
    shipping_way    1
    created_at      { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at      { Faker::Time.between(2.days.ago, Time.now, :all) }
    brand_id        1
    category_id     301
    size_id         10

    after(:create) do |item|
      create_list(:image, 1, item: item)
    end
  end

end

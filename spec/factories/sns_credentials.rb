FactoryGirl.define do
  factory :sns_credential do
    uid               "123456789"
    provider          "facebook"
    user_id           "1"
  end
end

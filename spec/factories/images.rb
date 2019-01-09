FactoryGirl.define do

  factory :image do
    image  File.open("#{Rails.root}/app/assets/images/img.jpeg")
  end

end

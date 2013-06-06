FactoryGirl.define do
  factory :user do
    name "Otto"
    password "12345678" 
    sequence :email do |n|
      "mail#{n}@example.com"
    end
  end
end
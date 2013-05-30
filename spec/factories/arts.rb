# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :art do
    title "MyString"
    artist "MyString"
    location "MyString"
    comment "MyText"
  end
end

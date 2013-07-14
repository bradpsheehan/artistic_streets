FactoryGirl.define do

  factory :art do
    title "Giant Face"
    artist "Banksy"
    comment "This one is hard to miss."
    location
  end

  factory :location do
    address "123 Fake St Denver CO"
    latitude 1.5
    longitude 1.5
    art
  end
end

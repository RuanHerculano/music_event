FactoryBot.define do
  factory :event do
    name { Faker::Name.name }
    schedule { DateTime.now }
    location { Faker::Name.name }
  end
end

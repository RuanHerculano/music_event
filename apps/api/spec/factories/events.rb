FactoryBot.define do
  factory :event do
    name { Faker::Name.name }
    schedule { DateTime.now }
  end
end

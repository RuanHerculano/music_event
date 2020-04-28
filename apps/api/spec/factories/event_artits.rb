FactoryBot.define do
  factory :event_artist do
    order { 1 }

    association :event, factory: :event
    association :artist, factory: :artist
  end
end

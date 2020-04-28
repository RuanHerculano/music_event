FactoryBot.define do
  factory :event_genre do
    association :event, factory: :event
    association :genre, factory: :genre
  end
end

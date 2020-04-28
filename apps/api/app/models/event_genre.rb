class EventGenre < ApplicationRecord
  belongs_to :event
  belongs_to :genre

  validates_uniqueness_of :genre, scope: :event_id
end

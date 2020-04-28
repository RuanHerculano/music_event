class EventArtist < ApplicationRecord
  belongs_to :event
  belongs_to :artist

  validates_uniqueness_of :artist, scope: :event_id

  validates :order, numericality: { greater_than_or_equal_to: 0 }
end

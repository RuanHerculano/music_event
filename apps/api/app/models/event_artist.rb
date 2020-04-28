class EventArtist < ApplicationRecord
  belongs_to :event
  belongs_to :artist

  validates :order, numericality: { greater_than_or_equal_to: 0 }
end

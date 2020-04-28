class Artist < ApplicationRecord
  has_many :event_artist
  has_many :event, through: :event_artist

  validates_presence_of :name
end

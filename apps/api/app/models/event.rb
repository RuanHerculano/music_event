class Event < ApplicationRecord
  has_many :event_artists
  has_many :artists, through: :event_artists
  has_many :event_genres
  has_many :genres, through: :event_genres

  validates :event_artists, presence: true, length: { minimum: 1 }
  validates :event_genres, presence: true, length: { minimum: 1 }
end

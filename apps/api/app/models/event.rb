class Event < ApplicationRecord
  has_many :artist_event
  has_many :artist, through: :artist_event
  has_many :event_genre
  has_many :genre, through: :event_genre
end

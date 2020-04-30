class Event < ApplicationRecord
  has_many :event_artists
  has_many :artists, through: :event_artists
  has_many :event_genres
  has_many :genres, through: :event_genres

  validates :event_artists, presence: true, length: { minimum: 1 }
  validates :event_genres, presence: true, length: { minimum: 1 }

  validates_presence_of :schedule
  validates_presence_of :location

  scope :joined_event_artists, (->() { joins(:event_artists).group('events.id') })

  scope :joined_event_genres, (->() { joins(:event_genres) })

  scope :festivals, (->() { joined_event_artists.having('COUNT(event_artists.*) > 1') })

  scope :concerts, (->() { joined_event_artists.having('COUNT(event_artists.*) = 1') })

  scope :order_by_schedule, (-> () { order('schedule ASC')} )

  scope :with_genres, (lambda do |genres|
    return unless genres

    joined_event_genres.where(event_genres: {genre_id: genres })
  end)

  scope :without_genres, (lambda do |genres| 
    return unless genres

    joined_event_genres.where.not(event_genres: { genre_id: genres })    
  end)
end

class AddArtistToEventArtist < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_artists, :artist, foreign_key: true, null: false
  end
end

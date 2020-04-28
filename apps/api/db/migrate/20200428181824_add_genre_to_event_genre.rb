class AddGenreToEventGenre < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_genres, :genre, foreign_key: true, null: false
  end
end

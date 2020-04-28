class AddEventToEventGenre < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_genres, :event, foreign_key: true, null: false
  end
end

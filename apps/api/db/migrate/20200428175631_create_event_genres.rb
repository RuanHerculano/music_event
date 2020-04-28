class CreateEventGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :event_genres do |t|

      t.timestamps
    end
  end
end

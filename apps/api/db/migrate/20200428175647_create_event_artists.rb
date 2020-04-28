class CreateEventArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :event_artists do |t|
      t.integer :order, null: false

      t.timestamps
    end
  end
end

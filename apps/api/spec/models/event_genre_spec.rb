require 'rails_helper'

RSpec.describe EventGenre, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:genre) }

    describe 'genre uniqueness on event' do
      let!(:artist) { create(:artist) }
      let!(:genre) { create(:genre) }
      let!(:event_artist) { EventArtist.new(artist: artist, order: 1) }
      let!(:event_genre) { EventGenre.new(genre: genre) }

      let!(:event) do
        Event.create!(name: 'Test Event',
                      schedule: DateTime.now,
                      location: 'test location',
                      event_artists: [event_artist],
                      event_genres: [event_genre]) 
      end

      subject { event.event_genres.first }

      it { is_expected.to validate_uniqueness_of(:genre).scoped_to(:event_id) }
    end
  end
end

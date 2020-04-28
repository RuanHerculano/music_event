require 'rails_helper'

RSpec.describe EventArtist, type: :model do
  describe '#validations' do
    it { is_expected.not_to allow_value(-1).for(:order) }
    it { is_expected.to allow_value(0).for(:order) }
    it { is_expected.to allow_value(300).for(:order) }

    describe 'artist uniqueness on event' do
      let!(:artist) { create(:artist) }
      let!(:genre) { create(:genre) }
      let!(:event_artist) { EventArtist.new(artist: artist, order: 1) }
      let!(:event_genre) { EventGenre.new(genre: genre) }

      let!(:event) do
        Event.create!(name: 'Test Event',
                      schedule: DateTime.now,
                      event_artists: [event_artist],
                      event_genres: [event_genre]) 
      end

      subject { event.event_artists.first }

      it { is_expected.to validate_uniqueness_of(:artist).scoped_to(:event_id) }
    end
  end

  describe '#associations' do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:artist) }
  end
end

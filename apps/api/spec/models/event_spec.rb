require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#validations' do
    it { is_expected.to validate_presence_of(:event_artists) }
    it { is_expected.to validate_presence_of(:event_genres) }
    it { is_expected.to validate_presence_of(:location) }
  end

  describe '#associations' do
    it { is_expected.to have_many(:event_artists) }
    it { is_expected.to have_many(:artists).through(:event_artists) }
    it { is_expected.to have_many(:event_genres) }
    it { is_expected.to have_many(:genres).through(:event_genres) }
  end

  describe '#scopes' do
    describe 'concerts' do
      let!(:genres) { create_list(:genre, 10) }
      let!(:artists) { create_list(:artist, 10) }
      let!(:event_genres) { genres.map {|genre| EventGenre.new(genre: genre) }}
      let!(:event_artists) do
        artists.map.with_index do |artist, index|
          EventArtist.new(order: index, artist: artist)
        end
      end
      let!(:concerts) do
        event_genres.map.with_index do |genre, index|
          Event.create!(name: 'Test event', 
                        schedule: DateTime.now,
                        location: 'test location',
                        event_artists: [event_artists[index]],
                        event_genres: [genre])
        end
      end
      let!(:event_genres_festival) { genres.map {|genre| EventGenre.new(genre: genre) }[0, 5] }
      let!(:event_artists_festival) do
        artists.map.with_index do |artist, index|
          EventArtist.new(order: index, artist: artist)
        end
      end
      let!(:festivals) do
        event_genres_festival.map.with_index do |genre, index|
          Event.create!(name: 'Test event', 
                        schedule: DateTime.now,
                        location: 'test location',
                        event_artists: [event_artists_festival[index], event_artists_festival[index + 5]],
                        event_genres: [genre])
        end
      end

      subject { described_class.concerts }

      it 'should bring only 10 itens' do
        expect(subject.length).to eq(10)
      end
    end

    describe 'festivals' do
      let!(:genres) { create_list(:genre, 10) }
      let!(:artists) { create_list(:artist, 10) }
      let!(:event_genres) { genres.map {|genre| EventGenre.new(genre: genre) }}
      let!(:event_artists) do
        artists.map.with_index do |artist, index|
          EventArtist.new(order: index, artist: artist)
        end
      end
      let!(:concerts) do
        event_genres.map.with_index do |genre, index|
          Event.create!(name: 'Test event', 
                        schedule: DateTime.now,
                        location: 'test location',
                        event_artists: [event_artists[index]],
                        event_genres: [genre])
        end
      end
      let!(:event_genres_festival) { genres.map {|genre| EventGenre.new(genre: genre) }[0, 5] }
      let!(:event_artists_festival) do
        artists.map.with_index do |artist, index|
          EventArtist.new(order: index, artist: artist)
        end
      end
      let!(:festivals) do
        event_genres_festival.map.with_index do |genre, index|
          Event.create!(name: 'Test event', 
                        schedule: DateTime.now,
                        location: 'test location',
                        event_artists: [event_artists_festival[index], event_artists_festival[index + 5]],
                        event_genres: [genre])
        end
      end

      subject { described_class.festivals }

      it 'should bring only 5 itens' do
        expect(subject.length).to eq(5)
      end
    end
  end
end

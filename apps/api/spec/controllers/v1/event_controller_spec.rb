require 'rails_helper'

RSpec.describe V1::EventController, type: :controller do
  render_views

  let!(:user) { User.create(email: 'test@emai.com',
                            password: '12345678',
                            password_confirmation: '12345678') }
  let!(:headers) { user.create_new_auth_token }

  before do
    request.env['CONTENT_TYPE'] = 'application/json'
  end

  describe '#create' do
    context 'when not logged in' do
      before do
        post :create
      end

      subject { response }

      it { is_expected.to be_unauthorized }
    end

    context 'when logged' do
      let!(:artist) { create(:artist) }
      let!(:genre) { create(:genre) }

      let(:request_body) do
        { event: { name: 'Test name',
                   schedule: DateTime.now,
                   artist_ids: [artist.id],
                   genre_ids: [genre.id] } }
      end

      let(:created_event) { Event.find_by(name: 'Test name') }

      before do
        request.headers.merge!(headers)

        post :create, params: request_body
      end

      subject { response }

      it { is_expected.to be_created }

      it 'creates the correct event' do
        expect(created_event).not_to be_nil
      end
    end
  end

  describe '#index' do
    context 'when not logged in' do
      before do
        get :index
      end

      subject { response }

      it { is_expected.to be_unauthorized }
    end

    context 'when logged' do
      let!(:genres) { create_list(:genre, 10) }
      let!(:artists) { create_list(:artist, 10) }
      let!(:event_genres) { genres.map {|genre| EventGenre.new(genre: genre) }}
      let!(:event_artists) do
        artists.map.with_index do |artist, index|
          EventArtist.new(order: index, artist: artist)
        end
      end

      let!(:events) do
        event_genres.map.with_index do |genre, index|
          Event.create!(name: 'Test event', 
                        schedule: DateTime.now,
                        event_artists: [event_artists[index]],
                        event_genres: [genre])
        end
      end

      let(:response_body) { JSON.parse(response.body) }

      before do
        request.headers.merge!(headers)

        get :index
      end

      subject { response }

      it { is_expected.to be_ok }

      it 'fetches the artists' do
        expect(response_body['events'].count).to eq(10)
      end
    end
  end
end

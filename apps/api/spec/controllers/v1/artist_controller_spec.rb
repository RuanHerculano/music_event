require 'rails_helper'

RSpec.describe V1::ArtistController, type: :controller do
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
      let(:request_body) do
        { artist: { name: 'Test name' } }
      end

      let(:created_artist) { Artist.find_by(name: 'Test name') }

      before do
        request.headers.merge!(headers)

        post :create, params: request_body
      end

      subject { response }

      it { is_expected.to be_created }

      it 'creates the correct artist' do
        expect(created_artist).not_to be_nil
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
      let!(:artists) { create_list(:artist, 10) }
      let(:response_body) { JSON.parse(response.body) }

      before do
        request.headers.merge!(headers)

        get :index
      end

      subject { response }

      it { is_expected.to be_ok }

      it 'fetches the artists' do
        expect(response_body['artists'].count).to eq(10)
      end
    end
  end
end

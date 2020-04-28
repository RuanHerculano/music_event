require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#validations' do
    it { is_expected.to validate_presence_of(:event_artists) }
    it { is_expected.to validate_presence_of(:event_genres) }
  end

  describe '#associations' do
    it { is_expected.to have_many(:event_artists) }
    it { is_expected.to have_many(:artists).through(:event_artists) }
    it { is_expected.to have_many(:event_genres) }
    it { is_expected.to have_many(:genres).through(:event_genres) }
  end
end

require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe '#validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#associations' do
    it { is_expected.to have_many(:event_artist) }
    it { is_expected.to have_many(:event).through(:event_artist) }
  end
end

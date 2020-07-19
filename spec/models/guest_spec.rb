# frozen_string_literal: true

RSpec.describe Guest, type: :model do
  it { is_expected.to have_many(:devices).dependent(:destroy) }

  it 'factory should be valid' do
    guest = build :guest

    expect(guest).to be_valid
  end
end

# frozen_string_literal: true

RSpec.describe Device, type: :model do
  it { is_expected.to belong_to :userable }

  it 'factory should be valid' do
    device = build :device

    expect(device).to be_valid
  end
end

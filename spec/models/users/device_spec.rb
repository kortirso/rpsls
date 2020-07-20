# frozen_string_literal: true

RSpec.describe Users::Device, type: :model do
  it { is_expected.to belong_to :userable }

  it 'factory should be valid' do
    users_device = build :users_device

    expect(users_device).to be_valid
  end
end

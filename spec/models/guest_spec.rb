# frozen_string_literal: true

RSpec.describe Guest, type: :model do
  it { is_expected.to have_many(:users_devices).class_name('Users::Device').dependent(:destroy) }
  it { is_expected.to have_many(:users_sessions).class_name('Users::Session').dependent(:destroy) }

  it 'factory should be valid' do
    guest = build :guest

    expect(guest).to be_valid
  end
end

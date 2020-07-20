# frozen_string_literal: true

RSpec.describe Users::Session, type: :model do
  it { is_expected.to belong_to :userable }

  it 'factory should be valid' do
    users_session = build :users_session

    expect(users_session).to be_valid
  end
end

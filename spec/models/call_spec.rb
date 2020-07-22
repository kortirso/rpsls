# frozen_string_literal: true

RSpec.describe Call, type: :model do
  it { is_expected.to belong_to :userable }

  it 'factory should be valid' do
    call = build :call

    expect(call).to be_valid
  end
end

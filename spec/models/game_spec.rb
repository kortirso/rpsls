# frozen_string_literal: true

RSpec.describe Game, type: :model do
  it { is_expected.to have_many(:players).dependent(:destroy) }
  it { is_expected.to have_many(:userables).through(:players) }

  it 'factory should be valid' do
    game = build :game

    expect(game).to be_valid
  end
end

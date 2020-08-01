# frozen_string_literal: true

RSpec.describe Player, type: :model do
  it { is_expected.to belong_to :userable }
  it { is_expected.to belong_to :game }
end

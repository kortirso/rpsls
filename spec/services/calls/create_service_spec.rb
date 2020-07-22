# frozen_string_literal: true

RSpec.describe Calls::CreateService do
  subject(:service) { described_class }

  let(:userable) { create :guest }

  it 'creates a new call' do
    expect { service.call(userable: userable) }.to change(Call, :count).by(1)
  end
end

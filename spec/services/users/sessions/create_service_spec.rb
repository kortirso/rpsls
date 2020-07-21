# frozen_string_literal: true

RSpec.describe Users::Sessions::CreateService do
  subject(:service) { described_class }

  let(:userable) { create :guest }

  it 'creates a new session' do
    expect { service.call(userable: userable) }.to change(Users::Session, :count).by(1)
  end
end

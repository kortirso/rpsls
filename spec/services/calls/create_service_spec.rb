# frozen_string_literal: true

RSpec.describe Calls::CreateService do
  subject(:service) { described_class }

  let(:userable) { create :guest }
  let(:call_service) { double }

  before do
    allow(CallRpcService::RpcClient).to receive(:new).and_return(call_service)
    allow(call_service).to receive(:send_call_request)
  end

  it 'creates a new call' do
    expect { service.call(userable: userable) }.to change(Call, :count).by(1)
  end

  it 'and sends it to rabbit mq' do
    service.call(userable: userable)

    expect(call_service).to have_received(:send_call_request)
  end
end

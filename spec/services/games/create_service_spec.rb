# frozen_string_literal: true

RSpec.describe Games::CreateService do
  subject(:service) { described_class }

  before do
    allow(CallRpcService::RpcClient).to receive(:new).and_return(call_service)
    allow(call_service).to receive(:send_call_request)
  end

  context 'for not 2 calls ids' do
    let!(:call) { create :call }
    let(:request) { service.call(call_ids: [call.id, 'unexisted']) }
    let(:call_service) { double }

    it 'failed' do
      result = request

      expect(result.success?).to eq false
    end

    it 'and does not create game' do
      expect { request }.not_to change(Game, :count)
    end

    it 'and does not create players' do
      expect { request }.not_to change(Player, :count)
    end

    it 'and does not delete calls' do
      expect { request }.not_to change(Call, :count)
    end

    it 'and resends calls' do
      request

      expect(call_service).to have_received(:send_call_request).with(call.id)
    end
  end

  context 'for 2 calls ids' do
    let!(:calls) { create_list(:call, 2) }
    let(:request) { service.call(call_ids: [calls.first.id, calls.last.id]) }
    let(:call_service) { double }

    it 'success' do
      result = request

      expect(result.success?).to eq true
    end

    it 'and creates game' do
      expect { request }.to change(Game, :count).by(1)
    end

    it 'and creates players' do
      expect { request }.to change(Player, :count).by(2)
    end

    it 'and deletes calls' do
      expect { request }.to change(Call, :count).by(-2)
    end

    it 'and does not resend calls' do
      request

      expect(call_service).not_to have_received(:send_call_request)
    end
  end
end

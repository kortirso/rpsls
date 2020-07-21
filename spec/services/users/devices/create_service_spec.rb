# frozen_string_literal: true

RSpec.describe Users::Devices::CreateService do
  subject(:service) { described_class }

  context 'for invalid parameters' do
    let(:device_params) { { device: { unique_id: '' } } }

    it 'does not create a new guest' do
      expect { service.call(device_params) }.not_to change(Guest, :count)
    end

    it 'and does not create a new device' do
      expect { service.call(device_params) }.not_to change(Users::Device, :count)
    end
  end

  context 'for valid parameters' do
    let(:device_params) { { device: { unique_id: SecureRandom.uuid } } }

    it 'creates a new guest' do
      expect { service.call(device_params) }.to change(Guest, :count).by(1)
    end

    it 'and creates a new device' do
      expect { service.call(device_params) }.to change(Users::Device, :count).by(1)
    end
  end
end

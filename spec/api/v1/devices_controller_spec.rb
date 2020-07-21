# frozen_string_literal: true

RSpec.describe Api::V1::DevicesController do
  describe 'POST#create' do
    context 'for invalid params' do
      let(:request) { post '/api/v1/devices.json', params: { device: { unique_id: '' } } }

      it 'does not create new device' do
        expect { request }.not_to change(Users::Device, :count)
      end

      context 'in answer' do
        before { request }

        it 'returns status 409' do
          expect(response.status).to eq 409
        end

        it 'and returns error message' do
          expect(JSON.parse(response.body)['errors']).not_to eq nil
        end
      end
    end

    context 'for existed user device' do
      let!(:users_device) { create :users_device }
      let(:request) { post '/api/v1/devices.json', params: { device: { unique_id: users_device.unique_id } } }

      it 'does not create new device' do
        expect { request }.not_to change(Users::Device, :count)
      end

      context 'in answer' do
        before { request }

        it 'returns status 200' do
          expect(response.status).to eq 200
        end

        it 'and does not return error message' do
          expect(JSON.parse(response.body)['errors']).to eq nil
        end
      end
    end

    context 'for valid params' do
      let(:request) { post '/api/v1/devices.json', params: { device: { unique_id: SecureRandom.uuid } } }

      it 'creates new device' do
        expect { request }.to change(Users::Device, :count).by(1)
      end

      context 'in answer' do
        before { request }

        it 'returns status 201' do
          expect(response.status).to eq 201
        end

        it 'and does not return error message' do
          expect(JSON.parse(response.body)['errors']).to eq nil
        end
      end
    end
  end
end

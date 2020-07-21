# frozen_string_literal: true

RSpec.describe Api::V1::Users::SessionsController do
  describe 'POST#create' do
    context 'for invalid params' do
      let(:request) { post '/api/v1/users/sessions.json', params: { email: '' } }

      it 'does not create new session' do
        expect { request }.not_to change(Users::Session, :count)
      end

      context 'in answer' do
        before { request }

        it 'returns status 401' do
          expect(response.status).to eq 401
        end

        it 'and returns error message' do
          expect(JSON.parse(response.body)['errors']).to eq 'No auth strategy found'
        end
      end
    end

    context 'for unexisted device' do
      let(:request) { post '/api/v1/users/sessions.json', params: { unique_id: 'unexisted' } }

      it 'does not create new session' do
        expect { request }.not_to change(Users::Session, :count)
      end

      context 'in answer' do
        before { request }

        it 'returns status 401' do
          expect(response.status).to eq 401
        end

        it 'and returns error message' do
          expect(JSON.parse(response.body)['errors']).to eq 'Authorization error'
        end
      end
    end

    context 'for existed device' do
      let!(:users_device) { create :users_device }
      let(:request) { post '/api/v1/users/sessions.json', params: { unique_id: users_device.unique_id } }

      it 'creates new session' do
        expect { request }.to change(Users::Session, :count).by(1)
      end

      context 'in answer' do
        before { request }

        it 'returns status 201' do
          expect(response.status).to eq 201
        end

        it 'and returns token in message' do
          expect(JSON.parse(response.body)['token']).not_to eq nil
        end
      end
    end
  end
end

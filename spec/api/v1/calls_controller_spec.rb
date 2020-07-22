# frozen_string_literal: true

RSpec.describe Api::V1::CallsController do
  describe 'POST#create' do
    it_behaves_like 'API auth without token'
    it_behaves_like 'API auth with invalid token'
    it_behaves_like 'API auth with token without session'

    context 'for valid user' do
      let!(:users_session) { create :users_session }
      let(:token) { JwtEncoder.encode(uuid: users_session.uuid) }

      context 'for existed call' do
        let(:request) { post '/api/v1/calls.json', params: { token: token } }

        before { create :call, userable: users_session.userable }

        it 'does not create new call' do
          expect { request }.not_to change(Call, :count)
        end

        context 'in answer' do
          before { request }

          it 'returns status 409' do
            expect(response.status).to eq 409
          end

          it 'and does not return error message' do
            expect(JSON.parse(response.body)['errors']).not_to eq nil
          end
        end
      end

      context 'for unexisted call' do
        let(:request) { post '/api/v1/calls.json', params: { token: token } }

        it 'creates new call' do
          expect { request }.to change(Call, :count).by(1)
        end

        context 'in answer' do
          before { request }

          it 'returns status 201' do
            expect(response.status).to eq 201
          end

          it 'and does not return error message' do
            expect(JSON.parse(response.body)['errors']).to eq nil
          end

          %w[id].each do |attr|
            it "and contains call #{attr}" do
              expect(response.body).to have_json_path("call/#{attr}")
            end
          end
        end
      end
    end

    def do_request(params={})
      post '/api/v1/calls.json', params: params
    end
  end
end

# frozen_string_literal: true

shared_examples_for 'API auth with invalid token' do
  let!(:users_session) { create :users_session }
  let(:token) { JwtEncoder.encode(uuid: users_session.uuid) }

  before { do_request(token: "#{token}1") }

  it 'returns status 401' do
    expect(response.status).to eq 401
  end

  it 'and contains error message' do
    expect(JSON.parse(response.body)).to eq('errors' => 'Signature verification error')
  end
end

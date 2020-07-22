# frozen_string_literal: true

shared_examples_for 'API auth with token without session' do
  let(:token) { JwtEncoder.encode(uuid: SecureRandom.uuid) }

  before { do_request(token: token) }

  it 'returns status 401' do
    expect(response.status).to eq 401
  end

  it 'and contains error message' do
    expect(JSON.parse(response.body)).to eq('errors' => 'Forbidden')
  end
end

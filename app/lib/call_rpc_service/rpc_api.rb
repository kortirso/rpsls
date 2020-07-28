# frozen_string_literal: true

module CallRpcService
  module RpcApi
    def send_call_request(call_id)
      payload = { call_id: call_id }.to_json
      publish(payload, type: 'send_call_request')
    end
  end
end

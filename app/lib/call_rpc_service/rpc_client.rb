# frozen_string_literal: true

require 'dry/initializer'
require_relative 'rpc_api'

module CallRpcService
  class RpcClient
    extend Dry::Initializer[undefined: false]
    include RpcApi

    option :queue, default: proc { create_queue }

    private

    def create_queue
      channel = RabbitMq.channel
      channel.queue('call_requests', durable: true)
    end

    def publish(payload, opts={})
      @queue.publish(
        payload,
        opts.merge(
          persistent: true,
          app_id:     'RPSLS'
        )
      )
    end
  end
end

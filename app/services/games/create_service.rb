# frozen_string_literal: true

module Games
  class CreateService
    prepend BasicService

    option :call_ids

    attr_reader :result

    def call
      find_calls
      validate_calls
      return if failure?

      start_game_with_players
    end

    private

    def find_calls
      @calls = Call.where(id: @call_ids)
    end

    def validate_calls
      return if @calls.size == 2

      resend_calls
      fail!('Service must has access to 2 calls')
    end

    def start_game_with_players
      Games::CreateTransaction.call(calls: @calls)
    end

    def resend_calls
      @calls.pluck(:id).each { |id| call_service.send_call_request(id) }
    end

    def call_service
      CallRpcService::RpcClient.new
    end
  end
end

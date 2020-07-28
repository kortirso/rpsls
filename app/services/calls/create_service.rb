# frozen_string_literal: true

module Calls
  class CreateService
    prepend BasicService

    option :userable

    attr_reader :result

    def call
      @result = Call.create userable: @userable
      call_service.send_call_request(@result.id)
    rescue ActiveRecord::RecordNotUnique
      fail!('User can have only 1 call at the moment')
    end

    private

    def call_service
      CallRpcService::RpcClient.new
    end
  end
end

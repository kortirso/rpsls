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
      ActiveRecord::Base.transaction do
        lock_calls
        create_game
        create_players
        delete_calls
      end
    end

    def lock_calls
      @calls.each(&:lock!)
    end

    def create_game
      @game = Game.create!
    end

    def create_players
      @calls.each { |element| Player.create!(game: @game, userable: element.userable) }
    end

    def delete_calls
      @calls.each(&:destroy!)
    end

    def resend_calls
      @calls.pluck(:id).each { |id| call_service.send_call_request(id) }
    end

    def call_service
      @call_service ||= CallRpcService::RpcClient.new
    end
  end
end

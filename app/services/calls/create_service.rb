# frozen_string_literal: true

module Calls
  class CreateService
    prepend BasicService

    option :userable

    attr_reader :result

    def call
      @result = Call.create userable: @userable
    rescue ActiveRecord::RecordNotUnique
      fail!('User can have only 1 call at the moment')
    end
  end
end

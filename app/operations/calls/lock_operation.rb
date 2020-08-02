# frozen_string_literal: true

module Calls
  class LockOperation
    prepend BasicOperation

    def call(input)
      input.fetch(:calls).each(&:lock!)
      Success(input)
    end
  end
end

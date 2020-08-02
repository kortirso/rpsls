# frozen_string_literal: true

module Calls
  class DestroyOperation
    prepend BasicOperation

    def call(input)
      input.fetch(:calls).each(&:destroy!)
      Success(input)
    end
  end
end

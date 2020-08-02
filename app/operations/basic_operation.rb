# frozen_string_literal: true

require 'dry/transaction/operation'

module BasicOperation
  def self.prepended(base)
    base.include Dry::Transaction::Operation
  end
end

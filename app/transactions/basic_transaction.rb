# frozen_string_literal: true

module BasicTransaction
  module ClassMethods
    def call(*args)
      new.call(*args)
    end
  end

  def self.prepended(base)
    base.include Dry::Transaction(container: TransactionsContainer)
    base.extend ClassMethods
  end
end

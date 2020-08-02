# frozen_string_literal: true

class TransactionsContainer
  extend Dry::Container::Mixin

  namespace 'games' do
    register 'create' do
      Games::CreateOperation.new
    end
  end

  namespace 'players' do
    register 'create' do
      Players::CreateOperation.new
    end
  end

  namespace 'calls' do
    register 'lock' do
      Calls::LockOperation.new
    end

    register 'destroy' do
      Calls::DestroyOperation.new
    end
  end
end

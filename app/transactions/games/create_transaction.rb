# frozen_string_literal: true

module Games
  class CreateTransaction
    prepend BasicTransaction

    step :lock_calls, with: 'calls.lock'
    step :create_game, with: 'games.create'
    step :create_players, with: 'players.create'
    step :destroy_calls, with: 'calls.destroy'
  end
end

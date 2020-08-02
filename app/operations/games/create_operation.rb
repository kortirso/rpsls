# frozen_string_literal: true

module Games
  class CreateOperation
    prepend BasicOperation

    def call(input)
      Success(
        input.merge(game: Game.create!)
      )
    end
  end
end

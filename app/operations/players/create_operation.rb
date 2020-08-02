# frozen_string_literal: true

module Players
  class CreateOperation
    prepend BasicOperation

    def call(input)
      input.fetch(:calls).each do |element|
        Player.create!(game: input.fetch(:game), userable: element.userable)
      end
      Success(input)
    end
  end
end

# frozen_string_literal: true

module Hands
  class CompareService
    prepend BasicService

    HAND_COMBINATIONS = {
      rock:     {
        rock: 0, scissors: 1, paper: -1, lizard: 1, spock: -1
      },
      scissors: {
        rock: -1, scissors: 0, paper: 1, lizard: 1, spock: -1
      },
      paper:    {
        rock: 1, scissors: -1, paper: 0, lizard: -1, spock: 1
      },
      lizard:   {
        rock: -1, scissors: -1, paper: 1, lizard: 0, spock: 1
      },
      spock:    {
        rock: 1, scissors: 1, paper: -1, lizard: -1, spock: 0
      }
    }.freeze

    DEFAULT_AVAILABLE_FIGURES = %i[rock scissors paper].freeze
    EXTENDED_AVAILABLE_FIGURES = %i[rock scissors paper lizard spock].freeze

    option :hand_1
    option :hand_2
    option :available_figures, default: proc { DEFAULT_AVAILABLE_FIGURES.size }

    attr_reader :result

    def call
      check_hand_value
      return if failure?

      @result = HAND_COMBINATIONS.dig(@hand_1, @hand_2)
    end

    private

    def check_hand_value
      fail!('Hand 1 uses unavailable value') unless current_available_figures.include?(@hand_1)
      fail!('Hand 2 uses unavailable value') unless current_available_figures.include?(@hand_2)
    end

    def current_available_figures
      case @available_figures
      when 5 then EXTENDED_AVAILABLE_FIGURES
      else DEFAULT_AVAILABLE_FIGURES
      end
    end
  end
end

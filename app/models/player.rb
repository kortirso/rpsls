# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :userable, polymorphic: true
  belongs_to :game
end

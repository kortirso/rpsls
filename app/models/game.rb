# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :userables, through: :players
end

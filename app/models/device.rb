# frozen_string_literal: true

class Device < ApplicationRecord
  belongs_to :userable, polymorphic: true
end

# frozen_string_literal: true

class Call < ApplicationRecord
  belongs_to :userable, polymorphic: true
end

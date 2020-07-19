# frozen_string_literal: true

module Userable
  extend ActiveSupport::Concern

  included do
    has_many :devices, as: :userable, dependent: :destroy
  end
end

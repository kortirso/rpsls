# frozen_string_literal: true

module Users
  class Device < ApplicationRecord
    self.table_name = 'users_devices'

    belongs_to :userable, polymorphic: true
  end
end

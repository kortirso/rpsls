# frozen_string_literal: true

module Users
  class Session < ApplicationRecord
    self.table_name = 'users_sessions'

    belongs_to :userable, polymorphic: true
  end
end

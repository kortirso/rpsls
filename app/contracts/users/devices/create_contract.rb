# frozen_string_literal: true

module Users
  module Devices
    class CreateContract < BasicContract
      params do
        required(:unique_id).filled(:string)
      end
    end
  end
end

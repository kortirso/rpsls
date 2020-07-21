# frozen_string_literal: true

module Users
  module Devices
    class CreateService
      prepend BasicService

      option :device do
        option :unique_id
      end

      attr_reader :result

      def call
        validate_with(Users::Devices::CreateContract, @device.to_h)
        return if errors.present?

        guest = Guest.create
        guest.users_devices.create(@device.to_h)
      end
    end
  end
end

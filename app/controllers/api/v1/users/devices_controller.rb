# frozen_string_literal: true

module Api
  module V1
    module Users
      class DevicesController < Api::V1::BaseController
        skip_before_action :authenticate, only: %i[create]
        before_action :find_device, only: %i[create]

        resource_description do
          short 'Device information resources'
          formats ['json']
        end

        api :POST, '/v1/users/devices.json', 'Creates device'
        param :device, Hash do
          param :unique_id, String, required: true, description: 'Unique ID'
        end
        error code: 409, desc: 'Conflict'
        def create
          service = ::Users::Devices::CreateService.call(device: device_params)
          if service.success?
            render json: {}, status: :created
          else
            render json: { errors: service.errors }, status: :conflict
          end
        end

        private

        def find_device
          device = ::Users::Device.find_by unique_id: params[:device][:unique_id]
          render json: {}, status: :ok if device
        end

        def device_params
          params.require(:device).permit(:unique_id)
        end
      end
    end
  end
end

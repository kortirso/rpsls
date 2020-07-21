# frozen_string_literal: true

module Api
  module V1
    module Users
      class SessionsController < Api::V1::BaseController
        resource_description do
          short 'Session information resources'
          formats ['json']
        end

        api :POST, '/v1/users/sessions.json', 'Creates session'
        param :unique_id, String, required: false, description: 'Unique device ID'
        error code: 401, desc: 'Unauthorized'
        error code: 409, desc: 'Conflict'
        def create
          service = ::Users::Sessions::CreateService.call(userable: auto_auth.userable)
          render json: { token: JwtEncoder.encode(uuid: service.result.uuid) }, status: :created
        rescue AuthFailure => e
          render json: { errors: e.message }, status: :unauthorized
        end

        private

        def auto_auth
          raise AuthFailure, 'No auth strategy found' unless params.key?(:unique_id)

          device_auth
        end

        def device_auth
          unique_id = params.require(%i[unique_id])
          device = ::Users::Device.find_by(unique_id: unique_id)
          raise AuthFailure, 'Authorization error' if device.nil?

          device
        end
      end
    end
  end
end

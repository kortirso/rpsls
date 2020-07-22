# frozen_string_literal: true

module Api
  module V1
    class CallsController < Api::V1::BaseController
      resource_description do
        short 'Call information resources'
        formats ['json']
      end

      api :POST, '/v1/calls.json', 'Creates call'
      error code: 401, desc: 'Unauthorized'
      error code: 409, desc: 'Conflict'
      def create
        service = ::Calls::CreateService.call(userable: Current.user)
        if service.success?
          render json: { call: { id: service.result.id } }, status: :created
        else
          render json: { errors: service.errors }, status: :conflict
        end
      end
    end
  end
end

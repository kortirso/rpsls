# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      AuthFailure = Class.new(StandardError)

      protect_from_forgery with: :null_session

      before_action :authenticate

      private

      def authenticate
        auto_auth
      rescue AuthFailure => e
        Current.user = nil
        render json: { errors: e.message }, status: :unauthorized
      end

      def auto_auth
        raise AuthFailure, 'There is no authorization token' unless params.key?(:token)

        user_auth(params[:token])
      end

      def user_auth(token)
        extract_uuid(token)
        find_session
        Current.user = @session.userable
      end

      def extract_uuid(token)
        @uuid = JwtEncoder.decode(token)
      rescue JWT::DecodeError
        raise AuthFailure, 'Signature verification error'
      end

      def find_session
        @session = ::Users::Session.find_by(uuid: @uuid.fetch('uuid', ''))
        raise AuthFailure, 'Forbidden' unless @session
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      AuthFailure = Class.new(StandardError)

      protect_from_forgery with: :null_session
    end
  end
end

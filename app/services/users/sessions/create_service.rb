# frozen_string_literal: true

module Users
  module Sessions
    class CreateService
      prepend BasicService

      option :userable

      attr_reader :result

      def call
        @result = Users::Session.create userable: @userable
      end
    end
  end
end

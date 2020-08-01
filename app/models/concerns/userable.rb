# frozen_string_literal: true

module Userable
  extend ActiveSupport::Concern

  included do
    has_many :users_devices, class_name: 'Users::Device', as: :userable, dependent: :destroy
    has_many :users_sessions, class_name: 'Users::Session', as: :userable, dependent: :destroy
    has_many :calls, as: :userable, dependent: :destroy
    has_many :players, as: :userable, dependent: :destroy
    has_many :games, through: :players
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    uuid { SecureRandom.uuid }
  end
end

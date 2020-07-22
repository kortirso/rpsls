# frozen_string_literal: true

FactoryBot.define do
  factory :guest do
    uuid { SecureRandom.uuid }
  end
end

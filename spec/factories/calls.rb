# frozen_string_literal: true

FactoryBot.define do
  factory :call do
    uuid { SecureRandom.uuid }
    association :userable, factory: :guest
  end
end

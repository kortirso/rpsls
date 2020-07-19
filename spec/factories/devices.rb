# frozen_string_literal: true

FactoryBot.define do
  factory :device do
    unique_id { '1234567890' }
    association :userable, factory: :guest
  end
end

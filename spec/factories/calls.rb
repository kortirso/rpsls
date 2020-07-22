# frozen_string_literal: true

FactoryBot.define do
  factory :call do
    association :userable, factory: :guest
  end
end

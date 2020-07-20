# frozen_string_literal: true

FactoryBot.define do
  factory :users_device, class: 'Users::Device' do
    unique_id { '1234567890' }
    association :userable, factory: :guest
  end
end

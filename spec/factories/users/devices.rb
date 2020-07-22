# frozen_string_literal: true

FactoryBot.define do
  factory :users_device, class: 'Users::Device' do
    uuid { SecureRandom.uuid }
    unique_id { '1234567890' }
    association :userable, factory: :guest
  end
end

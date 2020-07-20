# frozen_string_literal: true

FactoryBot.define do
  factory :users_session, class: 'Users::Session' do
    association :userable, factory: :guest
  end
end

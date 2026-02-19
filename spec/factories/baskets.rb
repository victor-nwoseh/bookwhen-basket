FactoryBot.define do
  factory :basket do
    sequence(:session_token) { |n| "test_token_#{n}" }
  end
end

FactoryBot.define do
  factory :basket_item do
    association :basket
    association :event
  end
end

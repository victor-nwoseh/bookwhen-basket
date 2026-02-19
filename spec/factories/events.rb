FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "Event #{n}" }
    description { "A great class you will enjoy." }
    location { "The Studio, Manchester" }
    start_time { 3.days.from_now.change(hour: 10, min: 0) }
    end_time { 3.days.from_now.change(hour: 11, min: 0) }
    capacity { 12 }
    price_pence { 1200 }
    category { "Yoga" }
    instructor { "Jane Smith" }
    spots_remaining { 6 }
  end
end

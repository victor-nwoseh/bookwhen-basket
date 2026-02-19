Event.destroy_all

Event.create!([
  {
    title: "Morning Vinyasa Flow",
    description: "A dynamic 60-minute yoga class linking breath to movement. Suitable for those with some yoga experience. Expect to move, sweat, and leave feeling energised.",
    location: "The Yoga Collective, 14 Northern Quarter, Manchester",
    start_time: 3.days.from_now.change(hour: 7, min: 30),
    end_time: 3.days.from_now.change(hour: 8, min: 30),
    capacity: 12,
    spots_remaining: 4,
    price_pence: 1400,
    category: "Yoga",
    instructor: "Sarah Mitchell"
  },
  {
    title: "Yin Yoga & Meditation",
    description: "A slow, deeply restorative practice holding poses for 3–5 minutes to release connective tissue. Ends with a 15-minute guided meditation. All levels welcome.",
    location: "Stillpoint Studio, 8 Park Lane, Leeds",
    start_time: 5.days.from_now.change(hour: 19, min: 0),
    end_time: 5.days.from_now.change(hour: 20, min: 15),
    capacity: 10,
    spots_remaining: 2,
    price_pence: 1200,
    category: "Yoga",
    instructor: "Sarah Mitchell"
  },
  {
    title: "HIIT & Strength Circuit",
    description: "45 minutes of high-intensity interval training combined with bodyweight strength work. No equipment needed. Burn calories and build functional strength.",
    location: "FitBase, 22 Deansgate, Manchester",
    start_time: 2.days.from_now.change(hour: 6, min: 30),
    end_time: 2.days.from_now.change(hour: 7, min: 15),
    capacity: 20,
    spots_remaining: 11,
    price_pence: 1000,
    category: "Fitness",
    instructor: "James Okafor"
  },
  {
    title: "Spin Class — Intervals",
    description: "A music-driven indoor cycling class alternating between sprints and climbs. All bikes adjusted to your fit before class. Cycling shoes available to borrow.",
    location: "FitBase, 22 Deansgate, Manchester",
    start_time: 4.days.from_now.change(hour: 7, min: 0),
    end_time: 4.days.from_now.change(hour: 7, min: 45),
    capacity: 15,
    spots_remaining: 7,
    price_pence: 1100,
    category: "Fitness",
    instructor: "James Okafor"
  },
  {
    title: "Boxing Fundamentals",
    description: "Learn the basics of boxing stance, footwork, and combinations in a safe, non-contact environment. Great for fitness, coordination, and stress relief.",
    location: "City Boxing Gym, 5 Whitworth St, Manchester",
    start_time: 6.days.from_now.change(hour: 18, min: 30),
    end_time: 6.days.from_now.change(hour: 19, min: 30),
    capacity: 12,
    spots_remaining: 0,
    price_pence: 1300,
    category: "Fitness",
    instructor: "Dele Adeyemi"
  },
  {
    title: "Introduction to Wheel Throwing",
    description: "Your first time on the pottery wheel. Learn centring, opening, and pulling up the walls. All materials and tools provided. Take home what you make after glazing.",
    location: "Clay & Co Studio, 3 Kelham Island, Sheffield",
    start_time: 7.days.from_now.change(hour: 10, min: 0),
    end_time: 7.days.from_now.change(hour: 12, min: 0),
    capacity: 8,
    spots_remaining: 3,
    price_pence: 4500,
    category: "Pottery",
    instructor: "Priya Sharma"
  },
  {
    title: "Hand Building Workshop — Sculptural Forms",
    description: "Explore slab, coil, and pinch techniques to create sculptural vessels. No wheel required. Perfect for those who want to work at their own pace. All levels.",
    location: "Clay & Co Studio, 3 Kelham Island, Sheffield",
    start_time: 10.days.from_now.change(hour: 14, min: 0),
    end_time: 10.days.from_now.change(hour: 16, min: 30),
    capacity: 10,
    spots_remaining: 6,
    price_pence: 3800,
    category: "Pottery",
    instructor: "Priya Sharma"
  },
  {
    title: "Saturday Art Club (Ages 5–8)",
    description: "A colourful two-hour session for young children exploring painting, collage, and printmaking. All materials provided. Parents welcome to stay.",
    location: "Bright Minds Centre, 11 Didsbury Rd, Manchester",
    start_time: 8.days.from_now.change(hour: 10, min: 0),
    end_time: 8.days.from_now.change(hour: 12, min: 0),
    capacity: 15,
    spots_remaining: 5,
    price_pence: 1800,
    category: "Children",
    instructor: "Emily Crawford"
  },
  {
    title: "Mini Chefs Cooking Class (Ages 7–11)",
    description: "Kids learn to make two simple recipes from scratch — chopping, measuring, cooking, and (best of all) eating their creations. Aprons and ingredients provided.",
    location: "Bright Minds Centre, 11 Didsbury Rd, Manchester",
    start_time: 11.days.from_now.change(hour: 10, min: 30),
    end_time: 11.days.from_now.change(hour: 12, min: 0),
    capacity: 12,
    spots_remaining: 8,
    price_pence: 2200,
    category: "Children",
    instructor: "Emily Crawford"
  },
  {
    title: "Introduction to Watercolour",
    description: "Learn to control washes, wet-on-wet technique, and colour mixing in this relaxed beginner session. All materials supplied. No experience necessary.",
    location: "Open Studio Gallery, 6 Chapel St, Salford",
    start_time: 9.days.from_now.change(hour: 13, min: 0),
    end_time: 9.days.from_now.change(hour: 15, min: 30),
    capacity: 10,
    spots_remaining: 4,
    price_pence: 2800,
    category: "Workshop",
    instructor: "Naomi Hastings"
  },
  {
    title: "Sourdough Bread Masterclass",
    description: "From starter to scoring — a full-day hands-on sourdough workshop. You will mix, ferment, shape, and bake a loaf to take home. Lunch included.",
    location: "The Hearth Bakery, 17 Albert Square, Manchester",
    start_time: 14.days.from_now.change(hour: 9, min: 30),
    end_time: 14.days.from_now.change(hour: 15, min: 0),
    capacity: 8,
    spots_remaining: 1,
    price_pence: 8500,
    category: "Workshop",
    instructor: "Tom Berwick"
  },
  {
    title: "Natural Dyeing with Plants",
    description: "Learn to extract colour from plants and dye fabric using traditional mordanting techniques. Take home a bundle of hand-dyed cloth. Suitable for complete beginners.",
    location: "Open Studio Gallery, 6 Chapel St, Salford",
    start_time: 18.days.from_now.change(hour: 10, min: 0),
    end_time: 18.days.from_now.change(hour: 13, min: 0),
    capacity: 10,
    spots_remaining: 9,
    price_pence: 3500,
    category: "Workshop",
    instructor: "Naomi Hastings"
  },
  {
    title: "Pilates — Core & Mobility",
    description: "A mat Pilates class focusing on core stability, hip mobility, and postural alignment. Ideal for desk workers and anyone recovering from mild lower back pain. All levels.",
    location: "Stillpoint Studio, 8 Park Lane, Leeds",
    start_time: 13.days.from_now.change(hour: 9, min: 0),
    end_time: 13.days.from_now.change(hour: 10, min: 0),
    capacity: 14,
    spots_remaining: 6,
    price_pence: 1200,
    category: "Fitness",
    instructor: "Rachel Donnelly"
  }
])

puts "Seeded #{Event.count} events"

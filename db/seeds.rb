Painting.destroy_all

User.new(email: "solene@email.com", password: "123456").save
User.new(email: "daniela@email.com", password: "123456").save
User.new(email: "celine@email.com", password: "123456").save
User.new(email: "samantha@email.com", password: "123456").save

User.all.each do |user|
  rand(2..5).times do
    Painting.new(name: Faker::Hipster.word.capitalize,
                 painter: Faker::Artist.name,
                 category: %w[Impressionism Realism Renaissance Street-Art Abstract Modern].sample,
                 location: Faker::Address.city,
                 dimensions: "#{rand(30..400)} x #{rand(30..400)}",
                 price_per_day: rand(20..500),
                 user: user
                 ).save
  end
end

Painting.all.each do |painting|
  rand(2..5).times do
    rating = rand(0..5)
    content = ["good quality", "well delivered", "I hosted a great dinner party", "perfect for realtors like me who need fancy paintings", "OK service", "Person was very punctual and helpful", "good", "Ok thanks", "nice!"].sample
    Review.create(
      rating: rating,
      content: content,
      painting: painting,
      user: User.all.sample
      )
  end
end

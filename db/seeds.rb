require "open-uri"

# Generate users if there isn't some already
User.new(email: "solene@email.com", password: "123456").save
User.new(email: "daniela@email.com", password: "123456").save
User.new(email: "celine@email.com", password: "123456").save
User.new(email: "samantha@email.com", password: "123456").save

# Getting ready to attach image to paintings
counter = 0
def attach_image (painting, counter)
  painting_urls = ["https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928724/art-bnb/paintings/painting20_ockfp2.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928661/art-bnb/paintings/painting4_d984nt.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928657/art-bnb/paintings/painting8_iznx7y.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928656/art-bnb/paintings/painting5_iypu5m.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928656/art-bnb/paintings/painting7_xu2l1s.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928655/art-bnb/paintings/painting2_lv0jx2.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928655/art-bnb/paintings/painting19_bjlfa4.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928655/art-bnb/paintings/painting6_pls0ck.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928654/art-bnb/paintings/painting11_mlog0v.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928654/art-bnb/paintings/painting9_bot1zq.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928653/art-bnb/paintings/painting15_duxzb7.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928653/art-bnb/paintings/painting18_zgt3yv.jpg"]
  file = URI.open(painting_urls[counter])
  painting.photo.attach(io: file, filename: "painting#{counter}.jpg", content_type: 'image/jpg')
end

# Destroying all past paintings
Painting.destroy_all

# Generate paintings and attach image
User.all.each do |user|
  3.times do
    painting = Painting.new(name: Faker::Hipster.word.capitalize,
                               painter: Faker::Artist.name,
                               category: %w[Impressionism Realism Renaissance Street-Art Abstract Modern].sample,
                               location: Faker::Address.city,
                               dimensions: "#{rand(30..400)} x #{rand(30..400)}",
                               price_per_day: rand(20..500),
                               user: user
                               )
    attach_image(painting, counter)
    painting.save
    counter += 1
  end
end

# Generate reviews for paintings
Painting.all.each do |painting|
  rand(2..5).times do
    rating = rand(2..5)
    content = ["good quality", "well delivered", "I hosted a great dinner party", "perfect for realtors like me who need fancy paintings", "OK service", "Person was very punctual and helpful", "good", "Ok thanks", "nice!", "cool", "awesome", "sweet"].sample
    Review.create(
      rating: rating,
      content: content,
      painting: painting,
      user: User.all.sample
      )
  end
end

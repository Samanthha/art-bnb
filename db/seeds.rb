require "open-uri"

# Destroying all past paintings
Painting.destroy_all
puts "> destroyed all paintings"

# Deletes all users
ActiveRecord::Base.connection.execute("DELETE FROM users")
puts "> destroyed all users"


# Generate users
User.new(email: "solene@email.com", password: "123456", first_name: "Solene", last_name: "Duprat").save
User.last.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161778/solene.jpg"), filename: "solene.jpg", content_type: 'image/jpg')
User.new(email: "daniela@email.com", password: "123456", first_name: "Daniela", last_name: "Santana").save
User.last.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161934/daniela_loxgl0.jpg"), filename: "daniela.jpg", content_type: 'image/jpg')
User.new(email: "celine@email.com", password: "123456", first_name: "Celine", last_name: "Rondeau").save
User.last.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161759/celine.jpg"), filename: "celine.jpg", content_type: 'image/jpg')
User.new(email: "samantha@email.com", password: "123456", first_name: "Samantha", last_name: "André").save
User.last.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161980/samantha_tuybqx.jpg"), filename: "samantha.jpg", content_type: 'image/jpg')
puts "> generated users: solene@email.com, daniela@email.com, celine@email.com, samantha@email.com"
puts "> attached profile pictures to users"

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
    painting.save!
    counter += 1
  end
end
puts "> gave each user 3 paintings"
puts "> attached pictures to paintings"

# Generate reviews for paintings
Painting.all.each do |painting|
  rand(2..5).times do
    rating = rand(2..5)
    content = ["good quality", "well delivered", "I hosted a great dinner party", "perfect for realtors like me who need fancy paintings", "OK service", "Person was very punctual and helpful", "good", "Ok thanks", "nice!", "cool", "awesome", "sweet"].sample
    Review.create!(
      rating: rating,
      content: content,
      painting: painting,
      user: User.all.sample
      )
  end
end
puts "> generated random reviews"

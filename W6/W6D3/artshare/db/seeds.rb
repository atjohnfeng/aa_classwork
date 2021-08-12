# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all

  user1 = User.create!(username: 'Jason')
  user2 = User.create!(username: 'John')
  
  art1 = Artwork.create!(title: 'Mona Lisa', image_url: 'monalisa.com', artist_id: user1.id)
  art2 = Artwork.create!(title: 'Totally Not Mona Lisa', image_url: 'tnmonalisa.com', artist_id: user2.id)

  share1 = ArtworkShare.create!(viewer_id: user1.id, artwork_id: art2.id)

end
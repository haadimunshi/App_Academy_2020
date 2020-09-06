# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

user1 = User.create(username: 'Haadi')
user2 = User.create(username: 'Alissa')
user3 = User.create(username: 'Gabriel')

artwork1 = Artwork.create(title: 'Mona Lisa', image_url: 'monalisa.com', artist_id: user1.id)
artwork2 = Artwork.create(title: 'Starry Night', image_url: 'starrynight.com', artist_id: user2.id)
artwork3 = Artwork.create(title: 'Last Supper', image_url: 'lastsupper.com', artist_id: user3.id)

artworkshare1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)
artworkshare2 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user3.id)
artworkshare3 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user1.id)

comment1 = Comment.create(user_id: user1.id, artwork_id: artwork2.id, body: "This is the body for comment 1")
comment2 = Comment.create(user_id: user2.id, artwork_id: artwork1.id, body: "This is the body for comment 2")
comment3 = Comment.create(user_id: user3.id, artwork_id: artwork2.id, body: "This is the body for comment 3")
comment4 = Comment.create(user_id: user1.id, artwork_id: artwork3.id, body: "This is the body for comment 4")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Comment.destroy_all
Like.destroy_all
Playlist.destroy_all
Video.destroy_all
PlaylistsVideo.destroy_all


u1 = User.create!(name: "Adam Xiao", username: "AdamXiao", password: "Pasta123", email: "adamxiao@hotmail.com")
u2 = User.create!(name: "Alex Szeto", username: "Aszeto", password: "leetcode", email: "aszeto@comcast.com")
u3 = User.create!(name: "Filip Todoroski", username: "ftodoroski", password: "hasgoodfood", email: "filip23@gmail.com")
u4 = User.create!(name: "Ty Williams", username: "tyree", password: "willi8ams", email: "ty.william@hotmail.com")
u5 = User.create!(name: "Steven Balasta", username: "StevenB", password: "password123", email: "steven_b@outlook.com")
u6 = User.create!(name: "Mari Shouvali", username: "sheeba200", password: "password123", email: "marishovali@yahoo.com")
u7 = User.create!(name: "Cindy Kei", username: "Keicindy505", password: "password123", email: "cindykei@outlook.com")
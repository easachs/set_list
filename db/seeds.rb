# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@bedouin = Artist.create!(name: "Bedouin Soundclash")
    @elongo = @bedouin.songs.create!(title: "Clock Work", length: 234, play_count: 20)
    @salt = @bedouin.songs.create!(title: "Salt Water", length: 236, play_count: 25)
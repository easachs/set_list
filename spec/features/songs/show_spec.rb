require 'rails_helper'

RSpec.describe 'songs show page' do
  # As a user, when I visit /songs/1...
  # then I see the song's title/artist...
  # and no other songs in the database.
  it 'displays song title' do
    artist = Artist.create!(name: "Milky Chance")
    song = artist.songs.create!(title: "Down By The River", length: 234, play_count: 15)
    song_2 = artist.songs.create!(title: "Stolen Dance", length: 432, play_count: 12)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays name of artist for song' do
    artist = Artist.create!(name: "Milky Chance")
    song = artist.songs.create!(title: "Down By The River", length: 234, play_count: 15)
    song_2 = artist.songs.create!(title: "Stolen Dance", length: 432, play_count: 12)
    visit "/songs/#{song.id}"
    
    expect(page).to have_content(artist.name)
  end
end
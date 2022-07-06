require 'rails_helper'

RSpec.describe 'songs index page', type: :feature do
  it 'can see all song titles and play count' do
    bedouin = Artist.create!(name: "Bedouin Soundclash")
    song_1 = bedouin.songs.create!(title: "Holy", length: 123, play_count: 5)
    song_2 = bedouin.songs.create!(title: "Drive", length: 234, play_count: 4)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end
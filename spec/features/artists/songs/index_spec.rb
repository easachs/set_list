# As a user, when I visit an Artist's Songs index
# Then I see the title's of all of that artist's songs
# And I see that each title is a link to the songs show page

require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @bedouin = Artist.create!(name: "Bedouin Soundclash")
    @elongo = @bedouin.songs.create!(title: "Elongo", length: 234, play_count: 20)
    @salt = @bedouin.songs.create!(title: "Salt Water", length: 236, play_count: 25)
  end

  it 'shows all titles of songs for the artist' do
    visit "/artists/#{@bedouin.id}/songs"

    expect(page).to have_content(@elongo.title)
    expect(page).to have_content(@salt.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@bedouin.id}/songs"

    click_on @elongo.title

    expect(current_path).to eq("/songs/#{@elongo.id}")
  end

  it 'shows avg song length for artist' do
    visit "/artists/#{@bedouin.id}/songs"

    expect(page).to have_content("Average Song Length for Bedouin Soundclash: 235")
  end
end
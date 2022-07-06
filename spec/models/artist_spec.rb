require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe 'average_song_length' do
      before :each do
        @bedouin = Artist.create!(name: "Bedouin Soundclash")
        @elongo = @bedouin.songs.create!(title: "Elongo", length: 234, play_count: 20)
        @salt = @bedouin.songs.create!(title: "Salt Water", length: 236, play_count: 25)
        @holy = @bedouin.songs.create!(title: "Holy", length: 21, play_count: 5)
      end

      it 'returns average song length' do
        expect(@bedouin.average_song_length.round(2)).to eq(163.67)
      end
    end
  end
end
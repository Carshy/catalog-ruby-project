require_relative '../Classes/music_album'

describe Genre do
  it 'testing the can_be_archived? method' do
    new_music = MusicAlbum.new(true, 1990)
    expect(new_music.can_be_archived?).to eql(true)
  end
end

require_relative '../Classes/music_album'

describe Genre do
  it 'should be an instance of Music album' do
    new_music = MusicAlbum.new(1990, true)
    expect(new_music).to be_instance_of MusicAlbum
  end

  it 'testing the can_be_archived? method' do
    new_music = MusicAlbum.new(1990, true)
    expect(new_music.can_be_archived?).to eql(true)
  end
end

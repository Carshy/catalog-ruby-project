require_relative '../Classes/genre'

describe Genre do
  it 'Genre for a musics album and the year it was published' do
    new_genre = Genre.new(2021, 'rap')
    expect(new_genre.publish_date).to eql(2021)
    expect(new_genre.name).to eql('rap')
  end

  it 'should be an instance of genre' do
    genre = Genre.new(2021, 'rap')
    expect(genre).to be_instance_of Genre
  end
end

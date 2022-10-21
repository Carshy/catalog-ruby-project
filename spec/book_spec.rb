require './Classes/book'

describe Book do
  before(:each) do
    @publisher = 'MacMillan'
    @cover_state = 'bad'
    @publish_date = 1993
    @book = Book.new(@publisher, @cover_state, @publish_date)
  end

  context 'When creating a new instance of the Book class' do
    it 'must return a book object including publisher, cover_state, publish date' do
      (@expected_value = @publisher
       expect(@book.publisher).to eql @expected_value)
      (@expected_value = @cover_state
       expect(@book.cover_state).to eql @expected_value)
      (@expected_value = @publish_date
       expect(@book.publish_date).to eql @expected_value)
    end

    it "should return true if parent method returns true OR if cover_state equals to 'bad'" do
      (@expected_value = true
       expect(@book.can_be_archived?).to eql @expected_value)
    end
  end
end

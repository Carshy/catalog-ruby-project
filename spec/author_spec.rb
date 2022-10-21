require './Classes/author'


describe Author do
  before do
    @author = Author.new('first', 'last')
  end

  it 'should return an instance of Author' do
    expect(@author).to be_instance_of Author
  end

  it 'should return first name' do
    expect(@author.first_name). to eq 'first'
  end

  it 'should return last name' do
    expect(@author.last_name). to eq 'last'
  end
end
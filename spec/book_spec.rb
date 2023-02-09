require './spec/spec_helper'

describe Book do
  before :all do
    @book = Book.new('book_name', 'book_author')
  end

  describe '#new' do
    it 'takes in two parameters and returns a book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  it 'should return book name' do
    expect(@book.title).to eq 'book_name'
  end
  it 'should return book author' do
    expect(@book.author).to eq 'book_author'
  end
end

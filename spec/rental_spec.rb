require './spec/spec_helper'

describe Rental do
  before :all do
    @student = Student.new(20, 'Greg', parent_permission: true)
    @book = Book.new('title_name', 'author_name')
    @rental = Rental.new('08/02/2023', @book, @student)
  end

  describe '#new' do
    it 'takes in three parameters and returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end
    it 'takes in two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
    it 'takes in three parameters and returns a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  it 'should return name of person who rented the book' do
    @student.add_rental(@rental)
    expect(@student.rentals[0].person.name).to eq @rental.person.name
  end

  it 'should return the book author' do
    @book.add_rental(@rental)
    expect(@book.rentals[0].book.author).to eq @rental.book.author
  end

  it 'should return the date the book was rented' do
    expect(@rental.date).to eq '08/02/2023'
  end
end

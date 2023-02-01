class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    rental.book = self
    @rentals.push(rental) unless @rentals.include?(rental)
  end
end

class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book =book
    book.rentals.push(self) unless book.rentals.include?(self)
  end
end

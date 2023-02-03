require_relative './person'

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
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end
end

# atomic_habit = Book.new('James Clear', 'Atomic Habit')
# game_of_thrones = Book.new('George R. R. Martin', 'Game of Thrones')
# alex = Person.new(19, 'Alex')
# rental = Rental.new('2021-01-01', atomic_habit, alex)
# alex.add_rental(rental)
# atomic_habit.add_rental(rental)
# alex.rentals

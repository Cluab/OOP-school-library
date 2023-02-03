require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './student'
require_relative './teacher'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def book(title, author)
    Book.new(title, author)
  end

  def classroom(label)
    Classroom.new(label)
  end

  def rental(date, book, person)
    Rental.new(date, book, person)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    case person_type
    when '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      student(age, name, parent_permission: parent_permission)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp.to_s
      teacher(age, name, specialization, parent_permission: parent_permission)
    else
      puts 'Invalid option'
      nil
    end
  end
end

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
    if @people.empty?
      puts 'Always remember that you can add yourself by typing "3" at the main menu.'
      return
    end
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

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    case parent_permission
    when 'y' || 'Y'
      parent_permission = true
    when 'n' || 'N'
      parent_permission = false
    else
      puts 'Invalid input'
      return
    end
    @people.push(Student.new(age, name, parent_permission: parent_permission))
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case person_type
    when '1'
      create_student(age, name)
    when '2'
      create_teacher(age, name)
    else
      puts 'Invalid option'
      nil
    end
  end
end

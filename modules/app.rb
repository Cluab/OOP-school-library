require 'json'
require_relative './rental'
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
    if @books.empty?
      puts 'There are no books in the library you can add one by typing "4" at the main menu.'
      return
    end
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    if @people.empty?
      puts 'Always remember that you can add yourself by typing "3" at the main menu.'
      return
    end
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      next unless rental.person.id == id

      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_index], @people[person_index]))
    puts 'Rental created successfully'
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'
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

  def save_people_data
    if @people.empty?
      puts 'There are no people to save'
      return
    end
    File.write('people.json', JSON.pretty_generate(
                                @people.map do |person|
                                  if person.instance_of?(Teacher)
                                    { name: person.name, age: person.age, parent_permission: person.parent_permission,
                                      specialization: person.specialization }
                                  else
                                    { name: person.name, age: person.age, parent_permission: person.parent_permission }
                                  end
                                end
                              ))
  end

  def save_books_data
    if @books.empty?
      puts 'There are no books to save'
      return
    end
    File.write('books.json', JSON.pretty_generate(@books.map { |book| { title: book.title, author: book.author } }))
  end

  def save_rentals_data
    if @rentals.empty?
      puts 'There are no rentals to save'
      return
    end
    File.write('rentals.json', JSON.pretty_generate(@rentals.map do |rental|
                                                      { date: rental.date, book: rental.book.title,
                                                        person: rental.person.name }
                                                    end))
  end

  def load_books_data
    return if File.zero?('books.json') || File.exist?('books.json') == false

    @books = JSON.parse(File.read('books.json')).map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def load_people_data
    return if File.zero?('people.json') || File.exist?('people.json') == false

    @people = JSON.parse(File.read('people.json')).map do |person|
      if person['specialization']
        Teacher.new(person['age'], person['specialization'], person['name'])
      else
        Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      end
    end
  end

  def load_rentals_data
    return if File.zero?('rentals.json') || File.exist?('rentals.json') == false

    @rentals = JSON.parse(File.read('rentals.json')).map do |rental|
      Rental.new(rental['date'], @books.find { |book| book.title == rental['book'] }, @people.find do |person|
                                                                                        person.name == rental['person']
                                                                                      end)
    end
  end
end

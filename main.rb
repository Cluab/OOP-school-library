#!/usr/bin/env ruby

require_relative './app'

class SchoolLibrary
  def initialize(app)
    @app = app
    @app.load_books_data
    @app.load_people_data
    @app.load_rentals_data
  end

  def run
    introduction
    option = gets.chomp.to_i
    handle_option(option)
  end

  private

  def introduction
    puts ''
    puts ''
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def handle_option(option)
    case option
    when 1..3
      handle_options_one(option)
    when 4..7
      handle_options_two(option)
    else
      puts 'Invalid input'
    end
    run unless option == 7
  end

  def handle_options_one(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    end
  end

  def handle_options_two(option)
    case option
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    when 7
      puts 'Thank you for using this app!'
      @app.save_books_data
      @app.save_people_data
      @app.save_rentals_data
    end
  end
end

def main
  app = App.new
  SchoolLibrary.new(app).run
end

main

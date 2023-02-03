#!/usr/bin/env ruby
# rubocop:disable
require_relative './app'
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

def opener(app)
  introduction
  option = gets.chomp.to_i
  checker(option, app)
end

def options_one(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  end
  opener(app)
end

def options_two(option, app)
  case option

  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  when 7
    puts 'Thank you for using this app!'
  end
  return unless option != 7

  opener(app)
end

def checker(option, app)
  if option >= 1 && option <= 3
    options_one(option, app)
    return
  end
  if option >= 4 && option <= 7
    options_two(option, app)
    return
  end
  return unless option < 1 || option > 7

  puts 'Invalid input'
  opener(app)
end

def main
  app = App.new
  opener(app)
end

main

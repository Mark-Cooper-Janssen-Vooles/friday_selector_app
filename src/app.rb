require 'colorize'
require 'tty-font'
require 'pastel'
require "tty-prompt"
require 'faker'
require_relative 'place.rb'
require_relative 'methods.rb'

require 'pry'

prompt = TTY::Prompt.new
font = TTY::Font.new(:doom)
pastel = Pastel.new

places = []
read_csv

Place.all.each do |place|
    places.push(place)
end

# name = ""
# def get_name(name)
#   name = ARGV[0]
# end 

# name = get_name(name)

name = ""
def get_name
    return name = ARGV[0]
end

name = get_name

puts `clear`

if name == nil
    puts "You have failed to enter a name as the argument when you started this app."
    puts "We will randomly generate a name for you, how do you like..."
    name = Faker::Name.name 
    #puts "Are you happy being known as #{name}?"
    response = prompt.select("Are you happy being known as #{name}?", %w(Yes No))

    if response == "No"
        puts "Okay. Lets try again. We're going to exit the program and you'll need to run it again, but you'll have to add an argument with your name if you don't like our random generator!"
        exit
    end
end
  
puts `clear`
puts pastel.blue.bold(font.write("FRIDAY", letter_spacing: 1.5))
puts "Welcome to the CoderAcademy Friday Selector app".white.on_black.underline

while true
 puts "#{name}, enter the number for the option you want to do:"
 puts "1. Pick a place at random"
 puts "2. Add a place to the database"
 puts "3. View places"
 #puts "4. List top 10 most popular places"
 #puts "3. Add a rating to an existing place"
 #puts "4. Remove a place from the database"
 #puts "5. List the top 10 most popular places"
 puts "6. Exit the program"
 print "> "
 option = STDIN.gets.strip.to_i
   if option == 1
        #select a place at random
        puts `clear`
        run_option_1(places)
   elsif option == 2
        #get user input to add to database
        info = OptionTwo.question_set
        #check if user is sure of their input
        places = OptionTwo.are_you_sure(info, places, name)
    elsif option == 3
        option_3_display_all(places)
    elsif option == 6
        option_6
        break
    else
        is_valid
   end
end
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
    #binding.pry
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
 puts "4. Update a rating to an existing place"
 #puts "4. Remove a place from the database"
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
        option_3_display(places)
    elsif option == 4

        def view_all(places)
            puts "-----------------------------"
            places_names = places.map do |place|
                place.name
            end
            places_names.sort.each do |places_name|
                puts places_name
            end
        puts "-----------------------------"
        end

        def delete_place(places, place_to_delete)
            places.each_with_index do |place, index|
                if place.name == place_to_delete
                    places.delete_at(index)
                    update_places_csv(places)
                    read_csv
                else
                    puts "That place is not in our database!"
                end
            end
            puts `clear`
            puts "The place was deleted from the database!"
        end

        def yes_delete(places)
            puts "Enter the name of the place you want to delete"
            print "> "
            place_to_delete = STDIN.gets.strip
            delete_place(places, place_to_delete)
        end

        puts `clear`
        prompt = TTY::Prompt.new
        response = prompt.select("Do you know the name of the place you want to delete, or do you want to view a list of all the places? (Warning: it may be long!)") do |menu|
            menu.choice "I want to see a list of places"
            menu.choice "I know the name of the place I want to delete."
        end

        if response == "I want to see a list of places"
            view_all(places)
            prompt2 = TTY::Prompt.new
            response2 = prompt2.select("Do you still want to delete a place?") do |menu|
                menu.choice "Yes"
                menu.choice "No"
            end
            if response2 == "Yes"
                yes_delete(places)
            elsif response2 == "No"
                puts `clear`
            end
        elsif response == "I know the name of the place I want to delete."
            yes_delete(places)
        end

    elsif option == 6
        option_6
        break
    else
        puts `clear`
        is_valid
   end
end
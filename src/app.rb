require_relative 'place.rb'
require_relative 'option_methods.rb'
require_relative 'starting_methods.rb'
require 'pry'

places = []
read_csv

Place.all.each do |place|
    places.push(place)
end

name = start_up

while true
 puts "#{name}, enter the number for the option you want to do:"
 puts "1. Pick a place at random"
 puts "2. Add a place to the database"
 puts "3. View places"
 puts "4. Remove a place from the database"
 puts "5. Update a rating to an existing place"
 puts "6. Exit the program"
 print "> "
 option = STDIN.gets.strip.to_i
   if option == 1
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
        option_4_delete_place(places)
    elsif option == 5
        option_5_update_rating(places)
    elsif option == 6
        option_6
        break
    else
        puts `clear`
        is_valid
   end
end
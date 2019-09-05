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

#marks_shuffle(places)

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
        run_option_2
    elsif option == 3
        run_option_3(places)
    elsif option == 4
        run_option_4(places)
    elsif option == 5
        run_option_5(places)
    elsif option == 6
        run_option_6
        break
    else
        puts `clear`
        is_valid
   end
end
require_relative 'place.rb'
require_relative 'methods.rb'

places = []
read_csv

Place.all.each do |place|
    places.push(place)
end

def update_places_csv(places)
    File.open(PLACES_FILE, "w") do |line|
        places.each do |i|
            the_line = "#{i.name},#{i.location},#{i.rating}\n"
            line.write (the_line)
        end 
    end
end

puts "Welcome to the CoderAcademy Friday Selector app."

while true
 puts "Enter the number for the option you want to do"
 puts "1. Pick a place at random"
 puts "2. Add a place to the database"
 puts "3. View all places"
 #puts "4. List top 10 most popular places"
 #puts "3. Add a rating to an existing place"
 #puts "4. Remove a place from the database"
 #puts "5. List the top 10 most popular places"
 puts "6. Exit the program"
 print "> "
 option = gets.strip.to_i
   if option == 1
        #select a place at random
        run_option_1(places)
   elsif option == 2
        #get user input
        info = question_set
        #check if user is sure
        places = are_you_sure(info, places)
    elsif option == 3
        puts "-----------------------------"
        places.each do |place|
            puts place.name
        end
        puts "-----------------------------"
    elsif option == 6
        option_6
        break
    else
        is_valid
   end
end
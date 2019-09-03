require_relative 'place.rb'

places = []
read_csv

Place.all.each do |place|
    places.push(place)
end

def update_places_csv(places)
    File.open('list_places.csv', "w") do |line|
        places.each do |i|
            the_line = "#{i.name},#{i.location},#{i.rating}\n"
            line.write (the_line)
        end 
    end
end


#put this in the area after i update places
# then call read_csv again...
#update_places_csv(places)


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
        puts "-----------------------------"
        puts "You should go to..."
        randomized_array = places.shuffle
        puts randomized_array[0].name
        puts randomized_array[0].location
        puts "-----------------------------"
   elsif option == 2
        puts "What is the name of the place you wish to add?"
        print "> "
        place_name = gets.strip
        puts "What is the location of the place you wish to add? Please type the street number, street and suburb."
        print "> "
        place_location = gets.strip
        puts "What would you rate this place out of 5? Feel free to use decimal places."
        print "> "
        place_rating = gets.strip.to_f
        #need to do some checking of data here
        puts "You have entered the place as name: #{place_name}, location: #{place_location}, rating: #{place_rating}"
        puts "If this information is correct and you wish to add it to the database, enter 'Y'. Otherwise enter 'N'."
        print "> "
        input = gets.strip.capitalize
        if input == 'Y'
            #code to add to CSV
            places_name = place_name + "1"
            places_name = Place.new({name: place_name, location: place_location, rating: place_rating})
            places.push(places_name)
            update_places_csv(places)

        elsif input == 'N'
            #re-run loop
        else
            puts "-----------------------------"
            puts "Please enter either 'Y' or 'N'."
            puts "-----------------------------"
        end
    elsif option == 3
        puts "-----------------------------"
        places.each do |place|
            puts place.name
        end
        puts "-----------------------------"
    elsif option == 6
        puts "-----------------------------"
        puts "Thank you for using the app. Good bye and enjoy your night!"
        puts "-----------------------------"
        break

    else
        puts "-----------------------------"
        puts "Please enter a valid option"
        puts "-----------------------------"
   end
end
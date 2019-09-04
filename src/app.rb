require_relative 'place.rb'
require_relative 'methods.rb'

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
        run_option_1(places)
   elsif option == 2
        #get user input
        info = question_set

        place_name = info[0]
        place_location = info[1]
        place_rating = info[2]

        status = "incomplete"
        while status == "incomplete"
            puts "in second loop"
            # puts "You have entered the place as name: #{place_name}, location: #{place_location}, rating: #{place_rating}"
            # puts "If this information is correct and you wish to add it to the database, enter 'Y'. Otherwise enter 'N'."
            # print "> "
            # input = gets.strip.capitalize
            # if input == 'Y'
            #     #code to add to CSV
            #     places_name = place_name + "1"
            #     places_name = Place.new({name: place_name, location: place_location, rating: place_rating})
            #     places.push(places_name)
            #     #update CSV then re-read the CSV
            #     update_places_csv(places)
            #     read_csv
            #     #exit loop
            #     status = true
            # elsif input == 'N'
            #     question_set
            # else
            #     puts "-----------------------------"
            #     puts "Please enter either 'Y' or 'N'."
            #     puts "-----------------------------"
            # end
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
require_relative 'place.rb'

#hardcoded options
# bottom_end = Place.new({name: "The Bottom End", location: "120 Spencer Street, Melbourne", rating: 5})
# network = Place.new({name: "Network Public Bar", location: "Southern Cross Station, 99 Spencer St, Docklandss", rating: 4.2})
# royal_melbourne_hotel = Place.new({name: "Royal Melbourne Hotel", location: "629 Bourke St, Melbourne", rating: 3.9})
# state_of_grace = Place.new({name: "State of Grace", location: "27 King St, Melbourne", rating: 4.4})

# places = [bottom_end, network, royal_melbourne_hotel, state_of_grace]

places = []
read_csv
Place.all.each do |place|
    places.push(place)
end

#print places

puts "Welcome to the CoderAcademy Friday Selector app."

while true
 puts "Enter the number for the option you want to do"
 puts "1. Pick a place at random"
 puts "2. Add a place to the database"
 #puts "3. Add a rating to an existing place"
 #puts "4. Remove a place from the database"
 #puts "5. List the top 10 most popular places"
 puts "6. Exit the program"
 print "> "
 option = gets.strip.to_i
   if option == 1
    #view contacts
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

    puts "You have entered the place as name: #{place_name}, location: #{place_location}, rating: #{place_rating} "

   elsif option == 6
    puts "Thank you for using the app. Good bye and enjoy your night!"
     break
   else
     puts "Please enter a valid option"
   end
end
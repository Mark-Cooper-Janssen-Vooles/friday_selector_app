require_relative 'option_methods.rb'

places = [{
    name: "the bottom end",
    rating: 4.6
},{
    name: "monkey bar", 
    rating: 2.3
},{
    name: "blah blah",
    rating: 2.6
}]

### Method test #1: 
puts "------------------------------"
puts ""
puts "TESTING METHOD #1"
puts ""
puts "The list of places in the array, with any rating, is:"
places.each do |place|
    puts place[:name]
end
puts ""
puts "Now applying the method..."
puts ""

def over_four_point_five(places)
    over_four_half = places.map do |place|
        if place[:rating].to_f >= 4.5 
            place
        end
    end
    over_four_half_array = []
    over_four_half.each do |place|
        if place != nil
            place[:name]
            over_four_half_array.push(place)
        end
    end
    return over_four_half_array
end

begin
    if over_four_point_five(places).length != 1
        raise ("there are places with less than 4.5 stars in the array")
    else
        puts ""
        puts "The new array, with places with a rating of only over 4.5 is:"
        over_four_point_five(places).each do |item|
            puts item[:name]
        end
        puts ""
        puts "TEST PASSED"
    end
rescue => error
    p error
    puts `say "something is wrong, master."`
end


#### Method test 2:
puts ""
puts "------------------------------"
puts ""
puts "TESTING METHOD #2"
puts ""

old_monkey_rating = places[1][:rating]

def update_place(places, place_to_update)
    in_database = false

    places.each do |place|
        if place[:name].downcase == place_to_update.downcase
            in_database = true
        end
    end

    if in_database == true
        places.each_with_index do |place, index|
            if place[:name].downcase == place_to_update.downcase
                puts "The current rating is #{place[:rating]}."
                puts "What rating do you want to give it instead?"
                puts "It can be anything from 1 to 5, decimals allowed."
                print "> "
                input = STDIN.gets.strip.to_f
                    #check if input is an 
                if input >= 1 && input <= 5 && input != place[:rating]
                    place[:rating] = input
                    #puts `clear`
                    puts "The rating for #{place[:name]} is now #{place[:rating]}."
                    #below methods just for the CSV, not tested here:
                    # update_places_csv(places)
                    # read_csv
                else
                    #puts `clear`
                    puts "------------------------------------------------------------"
                    puts "You need to put a number between 1 and 5 that isn't the current rating!"
                    puts "------------------------------------------------------------"
                end
            end
        end
    end
    if in_database == false
        #puts `clear`
        puts "------------------------------------------------------------"
        puts "That place is not in the database!"
        puts "------------------------------------------------------------"
    end
end

update_place(places, "monkey bar")

new_monkey_rating = places[1][:rating]

if old_monkey_rating != new_monkey_rating
    puts ""
    puts "You have updated the data. The old rating was #{old_monkey_rating}, and the new rating is #{new_monkey_rating}"
    puts ""
    puts "TEST PASSED"
else
    puts ""
    puts "TEST FAILED. The rating didn't update!"
end
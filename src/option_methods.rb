require_relative "csv.rb"
require "tty-prompt"
require "pry"

def marks_shuffle(places)
    # sorted_array = places.sort! do |place2, place1| 
    #     place1.rating.to_i <=> place2.rating.to_i
    # end

    # sorted_array.each do |place|
    #     place
    # end

    # print sorted_array

    sorted_array = places.sort do |place2, place1| 
        place2.rating.to_i <=> place1.rating.to_i 
    end.reverse

    sorted_array.each do |place|
        puts "#{place.name} | #{place.rating.to_s}"
    end


end

# def probability_distribution(prob, place)
#     randomized_array = []
#     if place.rating.to_i >= 4
#         if rand() <= prob
#             return place
#         end
#     else
#         return place
#     end
# end
            


def run_option_1(places)
    puts "------------------------------------------------------------"
    puts "You should go to..."
    randomized_array = places.shuffle
    puts randomized_array[0].name.white.on_black.underline
    puts randomized_array[0].location
    puts "------------------------------------------------------------"
    prompt1 = TTY::Prompt.new
    response = prompt1.select("Are you actually going to go there? Selecting yes will increase the visits count.", %w(Yes No))
    if response == "Yes"
        randomized_array[0].increase_visits
        update_places_csv(places)
        read_csv
        puts `clear`
        puts "------------------------------------------------------------"
        puts "Enjoy your vist to #{randomized_array[0].name}!"
        puts "------------------------------------------------------------"
        puts `say "Enjoy your vist to #{randomized_array[0].name}!"`
    else
        puts `clear`
    end
end

module OptionTwo
    #methods data_checker (used within module), question_set (used in app.rb), are_you_sure (used in app.rb)
    #is this a self method? used within option 2 methods... 
    def self.data_checker(data, num_or_word)
        if num_or_word == "word"
            if data.length > 0
                return data
            else
                puts "You must enter something!"
            end
        elsif num_or_word == "num"
            if data >= 1 && data <= 5
                return data
            elsif
                puts "You must enter a rating between 1 and 5!"
            end
        else
            puts "you, the DEVELOPER, need to enter the second argument as either 'num' or 'word'."
        end
    end

    def self.question_set
        puts `clear`
        name = ""
        while name == ""
            puts "What is the name of the place you wish to add?"
            print "> "
            place_name = STDIN.gets.strip.capitalize
            if data_checker(place_name, "word").class != NilClass
                name = place_name
            end
        end 
        place = ""
        while place == ""
            puts "What is the location of the place you wish to add? Please type the street number, street and suburb."
            print "> "
            place_location = STDIN.gets.strip
            if data_checker(place_location, "word").class != NilClass
                place = place_location
            end
        end
        rating = ""
        while rating == ""
            puts "What would you rate this place out of 5? Feel free to use decimal places. We recommend using the google rating for less bias."
            print "> "
            place_rating = STDIN.gets.strip.to_f
            if data_checker(place_rating, "num").class != NilClass
                rating = place_rating
            end
        end
        return [name, place, rating]
    end

    def self.are_you_sure(info, places, name)
        place_name = info[0]
        place_location = info[1]
        place_rating = info[2]
    
        status = "incomplete"
        while status == "incomplete"
            puts "You have entered the place as..."
            puts "name: #{place_name}, location: #{place_location}, rating: #{place_rating}".white.on_black.underline
            puts "If this information is correct, #{name}, and you wish to add it to the database, enter 'Y'. Otherwise enter 'N'."
            print "> "
            input = STDIN.gets.strip.capitalize
            if input == 'Y'
                #code to add to CSV
                places_name = place_name + "1"
                places_name = Place.new({created_by: name, name: place_name, location: place_location, rating: place_rating, visits: 0})
                places.push(places_name)
                #update CSV then re-read the CSV
                update_places_csv(places)
                read_csv
                #exit loop
                puts `clear`
                puts "------------------------------------------------------------"
                puts "You have successfully added #{places_name.name} to the database!"
                puts "------------------------------------------------------------"
                status = true
                return places
            elsif input == 'N'
                puts `clear`
                question_set
            else
                puts "-----------------------------"
                puts "Please enter either 'Y' or 'N'."
                puts "-----------------------------"
            end
        end
    end

end

def run_option_2
    #get user input to add to database
    info = OptionTwo.question_set
    #check if user is sure of their input
    places = OptionTwo.are_you_sure(info, places, name)
end

def run_option_3(places)
    puts `clear`
    prompt = TTY::Prompt.new
    response = prompt.select("Do you want to see a list ordered by most visited or highest rated?") do |menu|
        menu.choice "Most visited - all"
        menu.choice "Highest rated - all"
        menu.choice "Rated higher than 4.5 stars"
    end

    if response == "Most visited - all"
        puts `clear`
        puts "------------------------------------------------------------"
            sorted_array = places.sort! do |place2, place1| 
                place1.visits.to_i <=> place2.visits.to_i
            end

            sorted_array.each do |place|
                puts "#{place.name} | #{place.visits.to_s}"
            end
        puts "------------------------------------------------------------"
    elsif response == "Highest rated - all"
        puts `clear`
        puts "------------------------------------------------------------"
            sorted_array = places.sort do |place2, place1| 
                place2.rating.to_i <=> place1.rating.to_i 
            end.reverse
        
            sorted_array.each do |place|
                puts "#{place.name} | #{place.rating.to_s}"
            end
        puts "------------------------------------------------------------"
    elsif response == "Rated higher than 4.5 stars"
        puts `clear`
        puts "------------------------------------------------------------"
        def over_four_point_five(places)
            over_four_half = places.map do |place|
                if place.rating.to_f >= 4.5 
                    place
                end
            end
            over_four_half.compact!
            if over_four_half.length > 1
                over_four_half.each do |place|
                        puts place.name
                end
            else
                puts "There are no places with over 4.5 stars!"
            end
        end
        over_four_point_five(places)
        puts "------------------------------------------------------------"
    end

end

## methods for option 4
def view_all(places)
puts "------------------------------------------------------------"
places_names = places.map do |place|
    place.name
end
places_names.sort.each do |places_name|
    puts places_name
end
puts "------------------------------------------------------------"
end

def delete_place(places, place_to_delete)
    in_database = false

    puts "in delete_place method"
    places.each do |place|
        if place.name.downcase == place_to_delete.downcase
            in_database = true
        end
    end

    if in_database == true
        places.each_with_index do |place, index|
            if place.name.downcase == place_to_delete.downcase
                places.delete_at(index)
                update_places_csv(places)
                read_csv
                puts `clear`
                puts "------------------------------------------------------------"
                puts "'#{place.name}' was deleted from the database!"
                puts "------------------------------------------------------------"

            end
        end
    else
        puts `clear`
        puts "------------------------------------------------------------"
        puts "That place is not in our database!"
        puts "------------------------------------------------------------"
    end
end

def option_4_yes_delete(places)
    puts "Enter the name of the place you want to delete"
    print "> "
    place_to_delete = STDIN.gets.strip.downcase
    delete_place(places, place_to_delete)
end

def run_option_4(places)
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
            option_4_yes_delete(places)
        elsif response2 == "No"
            puts `clear`
        end
    elsif response == "I know the name of the place I want to delete."
        option_4_yes_delete(places)
    end
end

## methods for option 5

def update_place(places, place_to_update)
    in_database = false

    places.each do |place|
        if place.name.downcase == place_to_update.downcase
            in_database = true
        end
    end

    if in_database == true
        places.each_with_index do |place, index|
            if place.name.downcase == place_to_update.downcase
                puts "The current rating is #{place.rating}."
                puts "What rating do you want to give it instead?"
                puts "It can be anything from 1 to 5, decimals allowed."
                print "> "
                input = STDIN.gets.strip.to_f
                    #check if input is an 
                if input >= 1 && input <= 5 && input != place
                    place.rating = input
                    puts `clear`
                    puts "The rating for #{place.name} is now #{place.rating}."

                    update_places_csv(places)
                    read_csv
                else
                    puts `clear`
                    puts "------------------------------------------------------------"
                    puts "You need to put a number between 1 and 5"
                    puts "...and that isn't the current rating!"
                    puts "------------------------------------------------------------"
                end
            end
        end
    end
    if in_database == false
        puts `clear`
        puts "------------------------------------------------------------"
        puts "That place is not in the database!"
        puts "------------------------------------------------------------"
    end
end

def option_5_yes_update(places)
    puts "Enter the name of the place you want to update"
    print "> "
    place_to_update = STDIN.gets.strip
    update_place(places, place_to_update)
end

def run_option_5(places)
    puts `clear`
    prompt = TTY::Prompt.new
    response = prompt.select("Do you know the name of the place you want to update the rating for, or do you want to view a list of all the places? (Warning: it may be long!)") do |menu|
        menu.choice "I want to see a list of places"
        menu.choice "I know the name of the place I want to update."
    end

    if response == "I want to see a list of places"
        view_all(places)
        prompt2 = TTY::Prompt.new
        response2 = prompt2.select("Do you still want to update a place?") do |menu|
            menu.choice "Yes"
            menu.choice "No"
        end
        if response2 == "Yes"
            option_5_yes_update(places)
        elsif response2 == "No"
            puts `clear`
        end
    elsif response == "I know the name of the place I want to update."
        option_5_yes_update(places)
    end
end

def run_option_6
    puts `clear`
    puts "------------------------------------------------------------"
    puts "Thank you for using the app. Good bye and enjoy your night!"
    puts "------------------------------------------------------------"
    puts `say "Enjoy your night!"`
end

def is_valid
    puts "------------------------------------------------------------"
    puts "Please enter a valid option"
    puts "------------------------------------------------------------"
end
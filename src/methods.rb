def run_option_1(places)
    puts "-----------------------------"
    puts "You should go to..."

    randomized_array = places.shuffle
    puts randomized_array[0].name
    puts randomized_array[0].location
    puts "-----------------------------"
end

def data_checker(data, num_or_word)
    if num_or_word == "word"
        if data.length > 0
            return data
        else
            puts "You must enter something!"
        end
    elsif num_or_word == "num"
        if data > 0 && data < 6
            return data
        elsif
            puts "You must enter a rating between 1 and 5!"
        end
    else
        puts "you, the DEVELOPER, need to enter the second argument as either 'num' or 'word'."
    end
end

def question_set
    name = ""
    while name == ""
        puts "What is the name of the place you wish to add?"
        print "> "
        place_name = gets.strip.capitalize
        if data_checker(place_name, "word").class != NilClass
            name = place_name
        end
    end 

    place = ""
    while place == ""
        puts "What is the location of the place you wish to add? Please type the street number, street and suburb."
        print "> "
        place_location = gets.strip
        if data_checker(place_location, "word").class != NilClass
            place = place_location
        end
    end

    rating = ""
    while rating == ""
        puts "What would you rate this place out of 5? Feel free to use decimal places."
        print "> "
        place_rating = gets.strip.to_f
        if data_checker(place_rating, "num").class != NilClass
            rating = place_rating
        end
    end
    return [name, place, rating]
end

def are_you_sure(info, places)

    place_name = info[0]
    place_location = info[1]
    place_rating = info[2]

    status = "incomplete"
    while status == "incomplete"
        puts "You have entered the place as name: #{place_name}, location: #{place_location}, rating: #{place_rating}"
        puts "If this information is correct and you wish to add it to the database, enter 'Y'. Otherwise enter 'N'."
        print "> "
        input = gets.strip.capitalize
        if input == 'Y'
            #code to add to CSV
            places_name = place_name + "1"
            places_name = Place.new({name: place_name, location: place_location, rating: place_rating})
            places.push(places_name)
            #update CSV then re-read the CSV
            update_places_csv(places)
            read_csv
            #exit loop
            status = true
            return places
        elsif input == 'N'
            question_set
        else
            puts "-----------------------------"
            puts "Please enter either 'Y' or 'N'."
            puts "-----------------------------"
        end
    end
end

def option_6
    puts "-----------------------------"
    puts "Thank you for using the app. Good bye and enjoy your night!"
    puts "-----------------------------"
end
def run_option_1(places)
    puts "-----------------------------"
    puts "You should go to..."

    randomized_array = places.shuffle
    puts randomized_array[0].name
    puts randomized_array[0].location
    puts "-----------------------------"
end
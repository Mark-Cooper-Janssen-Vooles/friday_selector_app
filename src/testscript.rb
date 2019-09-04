require_relative 'methods.rb'

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

#method test #1: 
def over_four_point_five(places)
    over_four_half = places.map do |place|
        if place[:rating].to_f >= 4.5 
            place
        end
    end
    over_four_half_array = []
    over_four_half.each do |place|
        if place != nil
            puts place[:name]
            over_four_half_array.push(place)
        end
    end
    return over_four_half_array
end

begin
    if over_four_point_five(places).length != 1
        raise ("there are places with less than 4.5 stars in the array")
    else
        puts "the method worked!"
    end
rescue => error
    p error
    puts `say "something is wrong, master."`
end



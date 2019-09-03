class Place
    attr_reader :name, :location
    attr_accessor :rating
    def initialize(hash)
        @name = hash[:name]
        @location = hash[:location]
        @rating = hash[:rating]    
    end
    #possible description method?
    def self.all
        ObjectSpace.each_object(self).to_a
      end
end

PLACES_FILE = 'list_places.csv'
###Read information from CSV file: 
def read_csv
    headers = []
    values = []
    File.open(PLACES_FILE).each_with_index do |line, index|
        if index == 0 
        headers << line.split(',')
        else 
            values << line
        end
    end

    #turns .csv into array, splitting at each comma
    places_mapped = values.map do |place|
        place.split(',')
    end
    #adds .csv information into class to read the class database
    places_mapped.each do |place|
        Place.new({name: place[0], location: place[1], rating: place[2]})
    end
end

#read_csv
#use to check we have correctly created objects
#puts Place.all[0].name





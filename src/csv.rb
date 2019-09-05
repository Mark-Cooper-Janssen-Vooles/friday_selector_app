# frozen_string_literal: true

PLACES_FILE = 'list_places.csv'

# ##Read information from CSV file:
def read_csv
  values = []
  File.open(PLACES_FILE).each_with_index do |line, _index|
    values << line if line.length > 1
  end
  # turns .csv into array, splitting at each comma
  places_mapped = values.map do |place|
    place.split(',')
  end
  # adds .csv information into class to read the class database
  places_mapped.each do |place|
    Place.new(created_by: place[0], name: place[1], location: place[2], rating: place[3], visits: place[4])
  end
end

# ##Write information to CSV file:
def update_places_csv(places)
  File.open(PLACES_FILE, 'w') do |line|
    places.each do |i|
      the_line = "#{i.created_by},#{i.name},#{i.location},#{i.rating},#{i.visits}\n"
      line.write the_line
    end
  end
end

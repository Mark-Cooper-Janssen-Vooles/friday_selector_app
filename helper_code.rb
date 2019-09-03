## Contacts Termial Challenge ... bare-bones:
mark = {
 name: "Mark",
 phone: 61431175129,
 title: "Student at Coder Academy",
 location: "120 Spencer Street, Melbourne"
}
samaa = {
 name: "Samaa",
 phone: 61490336085,
 title: "Student at Coder Academy",
 location: "120 Spencer Street, Melbourne"
}
all_contacts = [mark, samaa]
puts "Welcome to your contacts app."
puts " "
puts "You can do several things in this app"
puts " "
puts "Please select one of the following options"
while true
 puts "Enter the number for the option you want to do"
 puts "1. View contacts"
 puts "2. Add contact"
 puts "3. Remove contact"
 puts "4. Exit"
 print "> "
 option = gets.strip.to_i
   if option == 1
     #view contacts
     puts "-----------------------------"
     all_contacts.each do |contact|
       puts "#{contact[:name]} +#{contact[:phone]}"
       puts contact[:title]
       puts contact[:location]
       puts "-----------------------------"
     end
   elsif option == 2
     #add contact
     puts "Please enter information in this order: name, phone number, title, location:"
     print "> "
     name_entry = gets.strip.capitalize
     print "> "
     phone_entry = gets.strip.to_i
     print "> "
     title_entry = gets.strip
     print "> "
     location_entry = gets.strip
     all_contacts.push({
       name: name_entry,
       phone: phone_entry,
       title: title_entry,
       location: location_entry
     })
   elsif option == 3
     #remove contact
     puts "What is the name of the contact you want to remove?"
     print "> "
     delete_name = gets.strip.capitalize
     if all_contacts.join(', ').include?(delete_name)
       all_contacts.each_with_index do |contact, index|
         if delete_name == contact[:name]
           puts "Are you sure you wish to delete the contact #{contact[:name]}? Y / N"
           the_option = gets.strip.downcase
           if the_option == "y"
             all_contacts.delete_at(index)
             puts "#{contact[:name]} has been deleted."
             break
           elsif the_option == "n"
             break
           else
             "Please enter either Y or N."
           end
         end
       end
     else
       puts "Cannot find the name in the current contacts."
     end
   elsif option == 4
     break
   else
     puts "Please enter a valid option"
   end
end

## Classes / array of hashes: 

require_relative '05_harrisons_car.rb'
#uses hash instead of arguments ... 
class Car
  def initialize(hash)
        p hash
      @make = hash[:make]
      @year = hash[:year]
      @mileage = hash[:mileage] 
      @color = hash[:color]   
  end
  def drive(distance)
      @mileage += distance
  end
  def description
      return "Make: #{@make}, Year: #{@year}, Mileage: #{@mileage}. #{self.is_vintage?}"
  end
  def is_vintage?

  end
end

holden = Car.new({make: 'holden', year: 2009, mileage: 3457, color: 'red'})

commute_distance = 10

10.times do
    holden.drive(commute_distance)
    #p holden.description
end

ford = Car.new({make: 'ford', year: 1965, mileage: 857, color: 'blue'})


p holden.year
p holden.is_vintage?


## Reading / Saving from CSV etc:

WIDGET_FILE = 'widget-data-in.csv'

headers = []
values = []
File.open(WIDGET_FILE).each_with_index do |line, index|
	if index == 0 
	headers << line.split(',')
	else 
		values << line
	end
end

obj_array = []
values.each_with_index do |obj, index|
	new_array = obj.split(',')
	obj_array.push({
		id: index + 1,
		name: new_array[0],
		description: new_array[1],
		lengthcms: new_array[2],
		widthcms: new_array[3],
		heightcms: new_array[4],
		weightgms: new_array[5],
		valueaud: new_array[6]
	})
end

def convert_string(obj)
	"#{obj[:id]},#{obj[:name]},#{obj[:description]},#{obj[:lengthcms]},#{obj[:widthcms]},#{obj[:heightcms]},#{obj[:weightgms]},#{obj[:valueaud]}"
end 

WIDGET_FILE_2 = 'widget-data-out.csv'

puts headers
headers.unshift("id")

def convert_header(arr)
	arr.join(',')
end

puts convert_header(headers)

File.open(WIDGET_FILE_2, "w") do |line|
	line.write(convert_header(headers))

	obj_array.each do |i|
		converted_object = convert_string(i)
		line.write (converted_object)
	end 

  end


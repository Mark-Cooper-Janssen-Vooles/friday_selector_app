require 'colorize'
require 'tty-font'
require 'pastel'
require "tty-prompt"
require 'faker'

prompt = TTY::Prompt.new
font = TTY::Font.new(:doom)
pastel = Pastel.new

def start_up

    prompt = TTY::Prompt.new
    font = TTY::Font.new(:doom)
    pastel = Pastel.new

    name = ""
    def get_name
        return name = ARGV[0]
    end

    name = get_name

    puts `clear`

    if name == nil
        puts "You have failed to enter a name as the argument when you started this app."
        puts "We will randomly generate a name for you, how do you like..."
        name = Faker::Name.name 
        #binding.pry
        response = prompt.select("Are you happy being known as #{name}?", %w(Yes No))

        if response == "No"
            puts "Okay. Lets try again. We're going to exit the program and you'll need to run it again, but you'll have to add an argument with your name if you don't like our random generator!"
            exit
        end
    end

    puts "------------------------------------------------------------"
    puts pastel.blue.bold(font.write("FRIDAY", letter_spacing: 1.5))
    puts "Welcome to the CoderAcademy Friday Selector app".white.on_black.underline
    puts "------------------------------------------------------------"
    #puts `say "Welcome to the CoderAcademy Friday Selector app"`
    #puts `clear`
    return name
end
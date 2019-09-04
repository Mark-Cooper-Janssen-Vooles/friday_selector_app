require 'colorize'

require "tty-prompt"

prompt = TTY::Prompt.new

name_var = prompt.ask('What is your name?', default: ENV['USER'])
puts name_var
prompt.yes?('Do you like Ruby?')

prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))

# puts String.modes
# puts "This is blue text on red".white.on_black
# puts "This is red on blue and underline".colorize(:red).on_blue.underline

####Colorize colors:
# black
# light_black
# red
# light_red
# green
# light_green
# yellow
# light_yellow
# blue
# light_blue
# magenta
# light_magenta
# cyan
# light_cyan
# white
# light_white
# default

##Modes: 
# default
# bold
# italic
# underline
# blink
# swap
# hide
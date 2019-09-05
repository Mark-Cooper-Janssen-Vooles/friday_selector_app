#for linx users
chmod +x ./build.sh
#copy across files to distribution directory
mkdir dist
cp ./src/app.rb ./dist
cp ./src/option_methods.rb ./dist
cp ./src/place.rb ./dist
cp ./src/starting_methods.rb ./dist
cp ./src/list_places.csv ./dist

cp ./src/testscript.rb ./dist
#install gems
gem install colorize
gem install faker
gem install pastel
gem install pry
gem install tty-font
gem install tty-prompt
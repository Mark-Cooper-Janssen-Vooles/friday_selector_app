#for linx users
chmod +x ./build.sh
#copy across files to distribution directory
mkdir dist
cp ./app.rb ./dist
#cp ./contacts.rb ./dist
#cp ./test.rb ./dist
#install gems
gem install colorize
gem install faker
# CoderAcademy Friday Selector App

## Instructions for use / Help

**Instructions**
* Resize your terminal to 60px wide
* Make sure your sound is on!
* From the current directory, in the terminal type 'sh bash.sh'.
* If you want to input your name, select 'No' and run 'ruby app.rb "your_name"' from the terminal.

**Dependencies**
The dependencies are all included in the bash script. They are colorize, faker, pastel, pry, tty-font and tty-prompt.

**System / hardware requirements**
Your system needs to be able to run Ruby, i.e. the ability to use rbenv which requires a unix or mac environment. 

**Features**
1. Picks a place at random to visit
2. Adds a place to the database
3. View places allows you to view, ranked by rating or visits or displays a custom list of places over 4.5 stars
4. Removes a place from the database
5. Updates a rating to an existing place
6. Exists the program

## Software Development Plan

* The initial menu items will be based off the *Contacts Terminal challenge*. The creation of a basic user interface will be the first step, with a working exit functionality to make it easier to test / work on the project in the terminal.

* A barebones minimum-viable product will be created initially which just selects from 4 hard-coded place instances, i.e. an array of hashes, and the first menu item, picking a place at random, will need to be implemented with a method. This will be based off the *car class challenge*.

* Following this, the addition of these being reading / writing from a .csv file will be implemented. This will be based off the *widget challenge*, and will enable the second menu item (add place to database) to get online.

* Following this removing a place will be the next method implemented, as well as listing the top 10 places based on their rating.

* The files will then be seperated into different files: app.rb as the basic flow of the app, methods.rb which will hold the methods that need to be called, and place.rb which will hold the place class.

* Then the implementation of gems will follow. Colorize will be used as well as Geocoder (to get the location of the place) among others.

* If there is time, a rating will be added to the place class and this will factor into the probability of a place being selected. I.e. places with a low rating will be selected less, and those with an unknown or higher rating will be selected more. At initialisation the user will be asked if they wish to provide a starting rating. 

## Statement of Purpose and Scope

An app that takes in recommendations, grows a .csv database and creates a randomly generated venue for activities after class on friday. It includes all CRUD features, you can ask the program to select a place for you to visit at random (read). You can create a new place to add to the database (create). You can view a list of all the places, sorted by your choosing from the options (read). You can update the rating of a place (update). You can delete a place from the database (delete). 

An advanced version of the app will create an algorithm and every instance of the "places" class will be assignemt a different probablily to appear based on its rating, which will be developed time permitting.

The application will choose a venue for students at Coder Academy who wish to partake in activities on friday after class if its decided we don't want to go to The Bottom End which was decided  

The aim is to remove decision fatigue and promote a more enjoyable experience for students at Coder Academy by providing a place to go to, as based off a probability generated from the ranking of a previously visted place.

A Coder Academy student, preferrably the student rep, will run the app and select an item from the menu. If they have been suggested places to add, they can add them to increase the database. If a place visited was disliked by the cohort, they can choose to delete it. If a place visited was better or worse than expected, the rating can be updated. When a place is chosen and confirmed that the cohurt will be visiting, the visit count for that place increases.

## Features 

The menu items will include: 
1. Pick a place at random
2. Add a place to the database 
3. Show all places names in the database
4. Remove a place from the database
5. Exit the program

Picking a place at random will call upon a method and pass it the array of instance objects of the places class. This method will be stored in another file, "option_methods.rb". The method will shuffle the array, and then pick the first (index zero) from this newly ordered array. 

Adding a place to the database will require a presistant database stored in a .csv file. Since the places themselves are going to be instance objects of the place class, they will need to be transformed from a string format into an object format each time the .csv file is read or written. Upon loading the program the .csv file will be read, and when a new place is added then the .csv file will need to be written (over written) and re-read. This function will require use of the inbuilt Ruby 'File' class. This option will need to allow user input to add the name, location, rating, and any other information the place may require. When the user inputs data there will need to be checks to see if they are entering valid data, including prompting the user to confirm if their entered data is what they meant. If their data is considered invalid, it will tell the user and loop back to the question. 

Showing all places names in the database will require a way to access the places names. A .each loop on the array "places" can loop through each of the objects stored in the places array, and display their names if a attr_reader is assigned to :name. The user will be prompted with the ability to show places ranked by their rating, their visits, or list of places that is over 4.5. 


## User Interaction and Experience

The user will start the program and a list of menu items will be displayed to them. They will simply input the number of the menu item they wish to do. They must enter 1, 2, 3, 4, 5 or 6. If they enter anything else, an error will displayed and they will be prompted to enter again. 

Picking a place at random will provide a place with a name, address, rating and distance from Coder Academy. They will then be asked if they are actually going to go there, and if they select yes this will increase the visits count by 1. This input is handled by the TTY-prompt gem so no error handling is required, as they can only pick for two options.

Adding a place to the database will create a new instance of the Place class. It will require the user to input a name, location, rating and any other data if more is added. If the user fails to enter required data, the program will notifiy the user and loop through again requesting the same data to be added. The data is required to be more than blank, however there is not currently a perfect way to check the data input and the format (especially for something like the address). In order to combat this, after entry to user is prompted to confirm if their entry is correct (and the entry is displayed to them). A more advanced version of the app could check the data more thoroughly, that it satisfies more criteria. 

Removing a place from the database will simply delete that instance of the Places class. The user will be prompted to confirm they want to remove the place. If what they enter isn't a places name, they will be told and no place will be removed.

Displaying a list of places will puts to the terminal a list of the places names found in the .csv database. It will prompt the user to order by rating, visits or to only see places over 4.5 stars - again this is handled by TTY-prompt so no error handling is required.

Exiting the program will quit the program.

## Control Flow Diagram

[Lucid Chart Link](https://www.lucidchart.com/documents/edit/c474d582-f730-4a51-812c-84875d9c1794/0_0?beaconFlowId=4322371CD802E6E4)


![Lucid Chart Screenshot](https://i.ibb.co/ngNsWxW/terminal-app.jpg "Lucid Chart Screenshot")

## Implementation Plan 

| Example Feature        | Steps           | Time to Complete  |
| ------------- |:-------------:| -----:|
| Return a randomized array, based on rating with a higher rating meaning a higher chance of appearance.    | Create the method, test to see if it works | 2 hours |
|       |      |    |
||       |     |


[Trello Project Management Link](https://trello.com/b/vN8tdQGt/terminal-app)

Screenshot 1: 
![Trello Screenshot 1](https://i.ibb.co/Wy8GvsD/Screen-Shot-2019-09-05-at-10-13-01-am.png "Trello Screenshot 1")

Screenshot 2: 
![Trello Screenshot 2](https://i.ibb.co/X3CNrJc/Screen-Shot-2019-09-05-at-10-11-58-am.png "Trello Screenshot 2")

Screenshot 3: 
![Trello Screenshot 3](https://i.ibb.co/594DFh9/Screen-Shot-2019-09-05-at-11-50-23-am.png "Trello Screenshot 3")

Screenshot 4: 
![Trello Screenshot 4](https://i.ibb.co/fH0j8D6/Screen-Shot-2019-09-05-at-4-16-45-pm.png "Trello Screenshot 4")

## Github Repository 

https://github.com/markke4/friday_selector_app
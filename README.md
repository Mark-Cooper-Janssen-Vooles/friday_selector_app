# CoderAcademy Friday Selector

An app that takes in recommendations, grows a .csv database and creates a randomly generated venue for activities after class on friday. 

An advanced version of the app will create an algorithm and every instance of the "places" class will be assignemt a different probablily to appear based on its rating. 

## Software Development Plan

* The initial menu items will be based off the *Contacts Terminal challenge*. The creation of a basic user interface will be the first step, with a working exit functionality to make it easier to test / work on the project in the terminal.

* A barebones minimum-viable product will be created initially which just selects from 4 hard-coded place instances, i.e. an array of hashes, and the first menu item, picking a place at random, will need to be implemented with a method. This will be based off the *car class challenge*.

* Following this, the addition of these being reading / writing from a .csv file will be implemented. This will be based off the *widget challenge*, and will enable the second menu item (add place to database) to get online.

* Following this removing a place will be the next method implemented, as well as listing the top 10 places based on their rating.

* The files will then be seperated into different files: app.rb as the basic flow of the app, methods.rb which will hold the methods that need to be called, and place.rb which will hold the place class.

* Then the implementation of gems will follow. Colorize will be used as well as Geocoder (to get the location of the place) among others.

* If there is time, a rating will be added to the place class and this will factor into the probability of a place being selected. I.e. places with a low rating will be selected less, and those with an unknown or higher rating will be selected more. At initialisation the user will be asked if they wish to provide a starting rating. 

### Statement of Purpose and Scope

The application will choose a venue for students at Coder Academy who wish to partake in activities on friday after class. 

The aim is to remove decision fatigue and promote a more enjoyable experience for students at Coder Academy by providing a place to go to, as based off a probability generated from the ranking of a previously visted place.

The target audience is Coder Academy students.

A Coder Academy student will simply turn the app on and select an item from the menu. 

### Features 

The menu items will include: 
1. Pick a place at random
2. Add a place to the database 
3. Show all places names in the database
4. Remove a place from the database
5. Exit the program

Picking a place at random will call upon a method and pass it the array of instance objects of the places class. This method will be stored in another file, "methods.rb". The method will shuffle the array, and then pick the first (index zero) from this newly ordered array. 

Adding a place to the database will require a presistant database stored in a .csv file. Since the places themselves are going to be instance objects of the place class, they will need to be transformed from a string format into an object format each time the .csv file is read or written. Upon loading the program the .csv file will be read, and when a new place is added then the .csv file will need to be written (over written) and re-read. This function will require use of the inbuilt Ruby 'File' class. This option will need to allow user input to add the name, location, rating, and any other information the place may require. When the user inputs data there will need to be checks to see if they are entering valid data, including prompting the user to confirm if their entered data is what they meant. Due to how many methods will be required for this option, there may be a module required for option two's methods. 

Showing all places names in the database will require a way to access the places names. A .each loop on the array "places" can loop through each of the objects stored in the places array, and display their names if a attr_reader is assigned to :name. 


### User Interaction and Experience

The user will start the program and a list of menu items will be displayed to them. They will simply input the number of the menu item they wish to do. 

Picking a place at random will provide a place with a name, address, rating and distance from Coder Academy. 

Adding a place to the database will create a new instance of the Place class. It will require the user to input a name, location, rating and any other data if more is added. If the user fails to enter required data, the program will notifiy the user and loop through again requesting the same data to be added. 

Removing a place from the database will simply delete that instance of the Places class. The user will be prompted to confirm they want to remove the place. 

Displaying a list of places will puts to the terminal a list of the places names found in te .csv database. 

Exiting the program will exit the program.

Errors will be need to be handled when retrieving from Gems, using rescue / catch. Other errors will be tested using if statements.

### Control Flow Diagram

use this to do it. 
include screenshot 

 1st attempt:
 https://www.lucidchart.com/documents/edit/336a31b0-b685-4d28-9eef-ee49e124b943/0_0?beaconFlowId=B97F72270375A25C

2nd attempt:
https://www.lucidchart.com/documents/edit/7fcfad27-3082-45e1-84e2-39ab4004f81a/0_0?beaconFlowId=74ED4AB24948A7E0

- show the workflow/logic and/or integration of the features in your application for each feature.
- utilise a recognised format or set of conventions for a control flow diagram, such as UML.

### Implementation Plan 

- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

[Trello Project Management Link](https://trello.com/b/vN8tdQGt/terminal-app)

Screenshot 1: 
![Trello Screenshot 1](https://i.ibb.co/Wy8GvsD/Screen-Shot-2019-09-05-at-10-13-01-am.png "Trello Screenshot 1")

Screenshot 2: 
![Trello Screenshot 2](https://i.ibb.co/X3CNrJc/Screen-Shot-2019-09-05-at-10-11-58-am.png "Trello Screenshot 2")

Screenshot 3: 
![Trello Screenshot 4](https://i.ibb.co/sbrGnMQ/Screen-Shot-2019-09-04-at-11-29-52-am.png "Trello Screenshot 3")


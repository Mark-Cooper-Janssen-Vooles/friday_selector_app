# CoderAcademy Friday Selector

## Software Development Plan

* The initial menu items will be based off the *Contacts Terminal challenge*. The creation of a basic user interface will be the first step, with a working exit functionality to make it easier to test / work on the project in the terminal.

* A barebones minimum-viable product will be created initially which just selects from 4 hard-coded place instances, i.e. an array of hashes, and the first menu item, picking a place at random, will need to be implemented with a method. This will be based off the *car class challenge*.

* Following this, the addition of these being reading / writing from a .csv file will be implemented. This will be based off the *widget challenge*, and will enable the second menu item (add place to database) to get online.

* Following this removing a place will be the next method implemented, as well as listing the top 10 places based on their rating.

* The files will then be seperated into different files: app.rb as the basic flow of the app, methods.rb which will hold the methods that need to be called, and place.rb which will hold the place class.

* Then the implementation of gems will follow. Colorize will be used among others. 

* If there is time, a rating will be added to the place class and this will factor into the probability of a place being selected. I.e. places with a low rating will be selected less, and those with an unknown or higher rating will be selected more. At initialisation the user will be asked if they wish to provide a starting rating. 

### Statement of Purpose and Scope

The application will choose a venue for students at Coder Academy who wish to partake in activities on friday after class. 

The aim is to remove decision fatigue and promote a more enjoyable experience for students at Coder Academy by providing a place to go to, as based off a probability generated from the ranking of a previously visted place.

The target audience is Coder Academy students.

A Coder Academy student will simply turn the app on and select an item from the menu. 

### Features 

An app that takes in recommendations, grows a .csv database and creates a randomly generated venue for activities after class on friday. 

An advanced version of the app will create an algorithm and every instance of the "places" class will be assignemt a different probablily to appear based on its rating. 

The menu items will include: 
1. Pick a place at random
2. Add a place to the database 
3. Add a rating to an existing place
4. Remove a place from the database
5. Display a list of the top 10 most popular places
6. Exit the program

### User Interaction and Experience

The user will start the program and a list of menu items will be displayed to them. They will simply input the number of the menu item they wish to do. 

Picking a place at random will provide a place with a name, address, rating and distance from Coder Academy. 

Adding a place to the database will create a new instance of the Place class. It will require the user to input a name and address, and the optional arguments of distance and rating. 

Adding a rating will enable the user add a rating (1-5) to the existing object. The rating will be an array. If there is already a rating present, there will be a feature which calculates the average score of the array.

Removing a place from the database will simply delete that instance of the Places class.

Displaying a list of the top 10 most popular places will display the 10 highest rated places

Exiting the program will exit the program.

Errors will be need to be handled when retrieving from Gems, using rescue / catch. Other errors will be tested using if statements.

### Control Flow Diagram

use this to do it. 
include screenshot 
 https://www.lucidchart.com/pages/home

- show the workflow/logic and/or integration of the features in your application for each feature.
- utilise a recognised format or set of conventions for a control flow diagram, such as UML.

### Implementation Plan 

- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

use this to do it: need 3 screenshots 
https://trello.com/b/vN8tdQGt/terminal-app

[Trello Project Management Link](https://trello.com/b/vN8tdQGt/terminal-app)


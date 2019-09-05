#Testing Outline 

##Method 1: 
This method takes an array of places (objects) and returns a filtered array which only includes places with a rating over 4.5.

It has hardcoded dummy data, the original array of places contains 3 items with only one place (the bottom end) which has a rating over 4.5, so it should return an array with only one item and dispaly "TEST PASSED".

This test uses a begin rescue.
To enter the rescue and display the error, simply change the number on line 44 to anything else but 1.

##Method 2: 
This method is designed to update the rating of a place. It takes in the hardcoded place "monkey bar", with a rating of 2.3 and should update the rating if the user input provided is between 1 and 5, and not the same as the existing rating (2.3). 

To test the fail message, enter 2.3 or anything outside the range of 1 and 5. To see a success message, enter anything in the range of 1 to 5 that isn't 2.3.
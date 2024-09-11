# Module 4 Graded Assessment

## Question 1: Fill in the blanks to complete the “confirm_length” function. This function should return how many characters a string contains as long as it has one or more characters, otherwise it will return 0. Complete the string operations needed in this function so that input like "Monday" will produce the output "6".

    def confirm_length(word):

        # Complete the condition statement using a string operation. 
        if len(word) >= 1:
            # Complete the return statement using a string operation.
            return len(word) 
        else:
            return 0


    print(confirm_length("a")) # Should print 1
    print(confirm_length("This is a long string")) # Should print 21
    print(confirm_length("Monday")) # Should print 6
    print(confirm_length("")) # Should print 0

## Question 2: Fill in the blank to complete the “string_words” function. This function should split up the words in the given “string” and return the number of words in the “string”.  Complete the string operation and method needed in this function so that a function call like "string_words("Hello, World")" will return the output "2".

    def string_words(string):
        # Complete the return statement using both a string operation and 
        # a string method in a single line.
        new_string = string.split()
        return len(new_string)


    print(string_words("Hello, World")) # Should print 2
    print(string_words("Python is awesome")) # Should print 3
    print(string_words("Keep going")) # Should print 2
    print(string_words("Have a nice day")) # Should print 4

## Question 3: Consider the following scenario about using Python lists: 

    Employees at a company shared  the distance they drive to work (in miles) through an online survey. These distances were automatically added by Python to a list called “distances” in the order that each employee submitted their distance. Management wants the list to be sorted in the order of the longest distance to the shortest distance. 

    Complete the function to sort the “distances” list. This function should:

    1) sort the given “distances” list, passed through the function’s parameters; ; 

    2) reverse the sort order so that it goes from the longest to the shortest distance;

    3) return the modified “distances” list.

    def sort_distance(distances):
        distances.sort() # Sort the list
        distances.reverse() # Reverse the order of the list
        return distances

    print(sort_distance([2,4,0,15,8,9]))
    # Should print [15, 9, 8, 4, 2, 0]

## Question 4: Fill in the blank to complete the “increments” function. This function should use a list comprehension to create a list of numbers incremented by 2 (n+2). The function receives two variables and should return a list of incremented consecutive numbers between “start” and “end” inclusively (meaning the range should include both the “start” and “end” values). Complete the list comprehension in this function so that input like “squares(2, 3)” will produce the output “[4, 5]”.

    def increments(start, end):
        return [n + 2 for n in range(start, end + 1)] # Create the required list comprehension.


    print(increments(2, 3)) # Should print [4, 5]
    print(increments(1, 5)) # Should print [3, 4, 5, 6, 7]
    print(increments(0, 10)) # Should print [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

## Question 5: Fill in the blanks to complete the “countries” function. This function accepts a dictionary containing a list of continents (keys) and several countries from each continent (values).  For each continent, format a string to print the names of the countries only. The values for each key should appear on their own line.

    def countries(countries_dict):
        result = ""
        # Complete the for loop to iterate through the key and value items 
        # in the dictionary.
        for continents, countries in countries_dict.items():
            # Use a string method to format the required string.
                result += "{} \n".format(countries)
        return result

    print(countries({"Africa": ["Kenya", "Egypt", "Nigeria"], "Asia":["China", "India", "Thailand"], "South America": ["Ecuador", "Bolivia", "Brazil"]}))

    # Should print:
    # ['Kenya', 'Egypt', 'Nigeria']
    # ['China', 'India', 'Thailand']
    # ['Ecuador', 'Bolivia', 'Brazil']

## Question 6: Consider the following scenario about using Python dictionaries: 

    Tessa and Rick are hosting a party. Together, they sent out invitations, and collected the responses in a dictionary, with names of their friends and the number of guests each friend will be bringing. 

    Complete the function so that the “check_guests” function retrieves the number of guests (value)  the specified friend “guest” (key) is bringing. This function should:

    1) accept a dictionary “guest_list” and a key “guest” variable passed through the function parameters;

    2) print the values associated with the key variable.

    def check_guests(guest_list, guest):
    return guest_list[guest] # Return the value for the given key

    guest_list = { "Adam":3, "Camila":3, "David":5, "Jamal":3, "Charley":2, "Titus":1, "Raj":6, "Noemi":1, "Sakira":3, "Chidi":5}

    print(check_guests(guest_list, "Adam")) # Should print 3
    print(check_guests(guest_list, "Sakira")) # Should print 3
    print(check_guests(guest_list, "Charley")) # Should print 2
	
## Question 7: Consider the following scenario about using Python dictionaries:

    A teacher is using a dictionary to store student grades. The grades are stored as a point value out of 100.  Currently, the teacher has a dictionary setup for Term 1 grades and wants to duplicate it for Term 2. The student name keys in the dictionary should stay the same, but the grade values should be reset to 0.

    Complete the “setup_gradebook” function so that input like “{"James": 93, "Felicity": 98, "Barakaa": 80}” will produce a resulting dictionary that contains  “{"James": 0, "Felicity": 0, "Barakaa": 0}”. This function should: 

    1) accept a dictionary “old_gradebook” variable through the function’s parameters;

    2) make a copy of the “old_gradebook” dictionary;

    3) iterate over each key and value pair in the new dictionary;

    4) replace the value for each key with the number 0;

    5) return the new dictionary.

    def setup_gradebook(old_gradebook):
        # Use a dictionary method to create a new copy of the "old_gradebook".
        new_gradebook = old_gradebook.copy() 
        # Complete the for loop to iterate over the new gradebook. 
        for student, grade in new_gradebook.items():
            # Use a dictionary operation to reset the grade values to 0.
            new_gradebook[student] = 0
        return new_gradebook

    fall_gradebook = {"James": 93, "Felicity": 98, "Barakaa": 80}
    print(setup_gradebook(fall_gradebook))
    # Should output {'James': 0, 'Felicity': 0, 'Barakaa': 0}

## Question 8: What do the following commands return when genre = "transcendental"?

    print(genre[:-8])
    print(genre[-7:9])

    transc, nd

## Question 9: What does the list "music_genres" contain after these commands are executed?

    music_genres = ["rock", "pop", "country"]
    music_genres.append("blues")

    ['rock', 'pop', 'country', 'blues']

## Question 10: What do the following commands return?

    teacher_names = {"Math": "Aniyah Cook", "Science": "Ines Bisset", "Engineering": "Wayne Branon"}
    teacher_names.values()

    dict_values(['Aniyah Cook', 'Ines Bisset', 'Wayne Branon'])
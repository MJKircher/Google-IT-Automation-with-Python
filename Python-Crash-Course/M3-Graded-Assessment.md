# Module 3 Graded Assessment

## Question 1: Fill in the blanks to print the even numbers from 2 to 12.

    number = 2 # Initialize the variable 
    while number <= 12: # Complete the while loop condition
        print(number, end=" ")
        number += 2 # Increment the variable

    # Should print 2 4 6 8 10 12 

## Question 2: Find and correct the error in the for loop.  The loop should print every number from 5 to 0 in descending order.

    for number in range(5,-1,-1):
        print(number)

    # Should print:
    # 5
    # 4
    # 3
    # 2
    # 1
    # 0

## Question 3: Fill in the blanks to complete the function “even_numbers(n)”. This function should count how many even numbers exist in a sequence from 0 to the given “n”number, where 0 counts as an even number.  For example, even_numbers(25) should return 13, and even_numbers(6) should return 4.

    def even_numbers(n):
        count = 0
        current_number = 0
        while n >= current_number: # Complete the while loop condition
            if current_number % 2 == 0:
                count += 1 # Increment the appropriate variable
            current_number += 1 # Increment the appropriate variable
        return count
        
    print(even_numbers(25))   # Should print 13
    print(even_numbers(144))  # Should print 73
    print(even_numbers(1000)) # Should print 501
    print(even_numbers(0))    # Should print 1

## Question 4: Fill in the blanks to complete the “multiplication_table” function. This function should print a multiplication table, where each number is the result of multiplying the first number of its row by the number at the top of its column. Complete the range sequences in the nested loops so that “multiplication_table(1, 3)” will print:

    1 2 3

    2 4 6

    3 6 9

    def multiplication_table(start, stop):
        # Complete the outer loop range
        for x in range(1,4): 
            # Complete the inner loop range
            for y in range(1,4):
                # Prints the value of "x" multiplied by "y" 
                # and inserts a space after each value
                print(str(x*y), end=" ")
            # An empty print() function inserts a line break at the 
            # end of the row 
            print()

    multiplication_table(1, 3)
    # Should print the multiplication table shown above

## Question 5: Fill in the blanks to complete the “countdown” function. This function should begin at the “start” variable, which is an integer that is passed to the function,  and count down to 0. Complete the code so that a function call like “countdown(2)” will return the numbers “2,1,0”.

    def countdown(start):
        x = start
        if x > 0:
            return_string = "Counting down to 0: "
            while x >= 0: # Complete the while loop
                return_string += str(x) # Add the numbers to the "return_string"
                if x > 0:
                    return_string += ","
                x = x-1 # Decrement the appropriate variable
        else:
            return_string = "Cannot count down to 0"
        return return_string


    print(countdown(10)) # Should be "Counting down to 0: 10,9,8,7,6,5,4,3,2,1,0"
    print(countdown(2)) # Should be "Counting down to 0: 2,1,0"
    print(countdown(0)) # Should be "Cannot count down to 0"

## Question 6: Fill in the blanks to complete the “odd_numbers” function. This function should return a space-separated string of all odd positive numbers, up to and including the “maximum” variable that's passed into the function. Complete the for loop so that a function call like “odd_numbers(6)” will return the numbers “1 3 5”.

    def odd_numbers(maximum):
        
        return_string = "" # Initializes variable as a string

        # Complete the for loop with a range that includes all 
        # odd numbers up to and including the "maximum" value.
        for x in range(0, maximum + 1): 

            # Complete the body of the loop by appending the odd number
            # followed by a space to the "return_string" variable.
            if not x % 2 == 0:
                return_string += str(x) + " "

        # This .strip command will remove the final " " space 
        # at the end of the "return_string".
        return return_string.strip()

    print(odd_numbers(6))  # Should be 1 3 5
    print(odd_numbers(10)) # Should be 1 3 5 7 9
    print(odd_numbers(1))  # Should be 1
    print(odd_numbers(3))  # Should be 1 3
    print(odd_numbers(0))  # No numbers displayed
	
## Question 7: What happens when the Python interpreter executes a loop where a variable used inside the loop is not initialized?

    Will produce a NameError stating the variable is not defined

## Question 8: What is the first number that will be printed in the first iteration of this loop? Your answer should be only one number.  

    for count in range(1, 6):
        print(count+1)

## Question 9: What number is printed at the end of this code?

    num1 = 0
    num2 = 0

    for x in range(5):
        num1 = x
        for y in range(14):
            num2 = y + 3

    print(num1 + num2)

    20

## Question 10: The following code causes an infinite loop. Can you figure out what is incorrect?

    def test_code(num):
    x = num
    while x % 2 == 0:
        x = x / 2

    test_code(0)

    When called with 0, it triggers an infinite loop
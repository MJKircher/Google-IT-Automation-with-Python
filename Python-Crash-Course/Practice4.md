# Practice Quiz: While Loops

## 1.What are while loops in Python?

    While loops let the computer execute a set of instructions while a condition is true.

## Question 2: Which techniques can prevent an infinite while loop? Select all that apply.

    Change the value of a variable used in the while condition
    Use the break keyword

## Question 3: The following code contains an infinite loop, meaning the Python interpreter does not know when to exit the loop once the task is complete. To solve the problem, you will need to:

    1) Find the error in the code

    2) Fix the while loop so there is an exit condition

    Hint: Try running your function with the number 0 as the input and observe the result.

    Note that Coursera’s code blocks will time out after 5 seconds of running an infinite loop. If you get this timeout error message, it means the infinite loop has not been fixed. 

    def is_power_of_two(number):
    # This while loop checks if the "number" can be divided by two
    # without leaving a remainder. How can you change the while loop to
    # avoid a Python ZeroDivisionError?
    while number % 2 == 0 and not number == 0:
        number = number / 2
    # If after dividing by 2 "number" equals 1, then "number" is a power
    # of 2.
    if number == 1:
        return True
    return False
    
    # Calls to the function
    print(is_power_of_two(0)) # Should be False
    print(is_power_of_two(1)) # Should be True
    print(is_power_of_two(8)) # Should be True
    print(is_power_of_two(9)) # Should be False

## Question 4: Write a function that takes an argument n and returns the sum of integers from 1 to n. For example, if n=5, your function should add up 1+2+3+4+5 and return 15. If n is less than 1, just return 0. Use a while loop to calculate this sum. 

    def sum_of_integers(n):
    if n < 1:
        return 0

    i = 1
    sum = 0
    while n >= i:
        sum = sum + i
        i = 1 + i

    return sum

    print(sum_of_integers(3))  # should print 6
    print(sum_of_integers(4))  # should print 10
    print(sum_of_integers(5))  # should print 15
 
## Question 5: Fill in the blanks to complete the function, which should output a multiplication table. The function accepts a variable “number” through its parameters. This “number” variable should be multiplied by the numbers 1 through 5, and printed in a format similar to “1x6=6” (“number” x “multiplier” = “result”). The code should also limit the “result” to not exceed 25. To satisfy these conditions, you will need to:

    1) Initialize the “multiplier" variable with the starting value

    2) Complete the while loop condition

    3) Add an exit point for the loop

    4) Increment the “multiplier" variable inside the while loop

    def multiplication_table(number):
        # Initialize the appropriate variable
        multiplier = 1

        # Complete the while loop condition.
        while multiplier <= 5:
            result = number * multiplier 
            if  result > 25:
                # Enter the action to take if the result > 25
                break
            print(str(number) + "x" + str(multiplier) + "=" + str(result))
            
            # Increment the appropriate variable
            multiplier += 1

    multiplication_table(3) 
    # Should print: 
    # 3x1=3 
    # 3x2=6 
    # 3x3=9 
    # 3x4=12 
    # 3x5=15

    multiplication_table(5) 
    # Should print: 
    # 5x1=5
    # 5x2=10
    # 5x3=15
    # 5x4=20
    # 5x5=25

    multiplication_table(8) 
    # Should print:
    # 8x1=8
    # 8x2=16
    # 8x3=24
# Module 2 Graded Assessment

## Question 1: Complete the code to output the statement, “Marjery lives at her home address of 1234 Mockingbird Lane”. Remember that precise syntax must be used to receive credit.

    name = "Marjery"
    home_address = "1234 Mockingbird Lane"
    print(name + " lives at her home address of " + home_address)
    # Should print "Marjery lives at her home address of 1234 Mockingbird Lane"

## 2.What's the value of this Python expression: "blue" == "Blue"?

    False

## 3.What is the elif keyword used for?

    To handle more than two comparison cases

## Question 4: Consider the following scenario about using if-elif-else statements:

    The fall weather is unpredictable.  If the temperature is 32 degrees Fahrenheit or below, a heavy coat should be worn.  If it is above 32 degrees but not above 50 degrees, then a jacket should be sufficient.  If it is above 50 but not above 65 degrees, a sweatshirt is appropriate, and above 65 degrees a t-shirt can be worn.  

    Fill in the blanks in the function below so it returns the proper clothing type for the temperature.

    def clothing_type(temp):
        if temp > 65:
            clothing = "T-Shirt"
        elif temp > 50 and not temp > 65:
            clothing = "Sweatshirt"
        elif temp > 32 and not temp > 50:
            clothing = "Jacket"
        else:
            clothing = "Heavy Coat"
        return clothing


    print(clothing_type(72)) # Should print T-Shirt
    print(clothing_type(55)) # Should print Sweatshirt
    print(clothing_type(65)) # Should print Sweatshirt
    print(clothing_type(50)) # Should print Jacket
    print(clothing_type(45)) # Should print Jacket
    print(clothing_type(32)) # Should print Heavy Coat
    print(clothing_type(0)) # Should print Heavy Coat


## Question 5: When using an if statement, the code inside the if block will only execute if the conditional statement returns what?

    True

## Question 6: Fill in the blanks to complete the function.  The character translator function receives a single lowercase letter, then prints the numeric location of the letter in the English alphabet.  For example, “a” would return 1 and “b” would return 2. Currently, this function only supports the letters “a”, “b”, “c”, and “d” It returns "unknown" for all other letters or if the letter is uppercase.

    def letter_translator(letter):
        if letter == "a":
            letter_position = 1
        elif letter == "b":
            letter_position = 2
        elif letter == "c":
            letter_position = 3
        elif letter == "d":
            letter_position = 4
        else:
            letter_position = "unknown"
        return letter_position


    print(letter_translator("a")) # Should print 1
    print(letter_translator("b")) # Should print 2
    print(letter_translator("c")) # Should print 3
    print(letter_translator("d")) # Should print 4
    print(letter_translator("e")) # Should print unknown
    print(letter_translator("A")) # Should print unknown
    print(letter_translator("")) # Should print unknown
	
## Question 7: Can you calculate the output of this code?

    def sum(x, y):
            return(x+y)
    print(sum(sum(1,2), sum(3,4)))

    10

## Question 8: What's the value of this Python expression? ((10 >= 5*2) and (10 <= 5*2))

    True

## Question 9: Fill in the blanks to complete the “safe_division” function. The function accepts two numeric variables through the function parameters and divides the “numerator” by the “denominator”. The function’s main purpose is to prevent a ZeroDivisionError by checking if the “denominator” is 0. If it is 0, the function should return 0 instead of attempting the division. Otherwise all other numbers will be part of the division equation. Complete the body of the function so that the function completes its purpose.

    def safe_division(numerator, denominator):
        # Complete the if block to catch any "denominator" variables
        # that are equal to 0.
        if denominator == 0:
            result = 0
        else:
            # Complete the division equation.
            result = numerator/denominator
        return result


    print(safe_division(5, 5)) # Should print 1.0
    print(safe_division(5, 4)) # Should print 1.25
    print(safe_division(5, 0)) # Should print 0
    print(safe_division(0, 5)) # Should print 0.0

## Question 10: What are some of the benefits of good code style? Select all that apply.

    Makes the intent of the code obvious
    Easier to maintain
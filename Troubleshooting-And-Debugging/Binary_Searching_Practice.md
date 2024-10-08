# Practice Quiz: Binary Searching a Problem

## Question 1: You have a list of computers that a script connects to in order to gather SNMP traffic and calculate an average for a set of metrics. The script is now failing, and you do not know which remote computer is the problem. How would you troubleshoot this issue using the bisecting methodology?

    Run the script with the first half of the computers.

## Question 2: The find_item function uses binary search to recursively locate an item in a list, returning True if found, False otherwise. Something is missing from this function. Can you spot what it is and fix it? Add debug lines where appropriate to help you narrow down the problem.

    def find_item(list, item):
    #Returns True if the item is in the list, False if not.
    if len(list) == 0:
    return False

    #Check to see if item is in list.
    if item in list:
        pass
    else:
        return False

    #Is the item in the center of the list?
    middle = len(list)//2
    
    #Debugging Code
    #print(middle)
    #print(str(list[middle]))
    
    if list[middle] == item:
    return True

    #Is the item in the first half of the list?
    #This was previously checking if the value of item string was higher than middle string
    if list.index(item) < middle:
    #Call the function with the first half of the list
    return find_item(list[:middle], item)
    else:
    #Call the function with the second half of the list
    return find_item(list[middle+1:], item)

    return False

    #Do not edit below this line - This code helps check your work!
    list_of_names = ["Parker", "Drew", "Cameron", "Logan", "Alex", "Chris", "Terry", "Jamie", "Jordan", "Taylor"]

    print(find_item(list_of_names, "Alex")) # True
    print(find_item(list_of_names, "Andrew")) # False
    print(find_item(list_of_names, "Drew")) # True
    print(find_item(list_of_names, "Jared")) # False

## Question 3: The binary_search function returns the position of key in the list if found, or -1 if not found. You want to make sure that it's working correctly, so you need to place debugging lines to let you know each time that the list is cut in half, whether you're on the left or the right. You do not want to print anything when the key is located.

    def binary_search(list, key):
        list.sort() # Binary search starts with a sorted list
        left = 0 # The first value of the list
        right = len(list) - 1 # The last value of the list

        while left <= right:
            middle = (left + right) // 2

            if list[middle] == key:
                print("Middle element")
                return middle
            elif list[middle] > key:
                print("Checking the left side")
                right = middle - 1
            else:
                print("Checking the right side")
                left = middle + 1
        return -1

    print(binary_search([10, 2, 9, 6, 7, 1, 5, 3, 4, 8], 1))

    print(binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5))

## Question 4: When trying to find an error in a log file or output to the screen, what command can we use to review, say, the first 10 lines?

    head

## Question 5: The best_search function compares linear_search and binary_search functions to locate a key in the list, returns how many steps each method took, and which method is the best for that situation. The list does not need to be sorted, as the binary_search function sorts it before proceeding (and uses one step to do so). Here, linear_search and binary_search functions both return the number of steps that it took to either locate the key or determine that it's not in the list. If the number of steps is the same for both methods (including the extra step for sorting in binary_search), then the result is a tie. Fill in the blanks to make this work.

    def linear_search(list, key):
    #Returns the number of steps to determine if key is in the list


    #Initialize the counter of steps
    steps=0
    for i, item in enumerate(list):
        steps += 1
        if item == key:
            break
    return steps


    def binary_search(list, key):
    #Returns the number of steps to determine if key is in the list

    #List must be sorted:
    list.sort()

    #The Sort was 1 step, so initialize the counter of steps to 1
    steps=1

    left = 0
    right = len(list) - 1
    while left <= right:
        steps += 1
        middle = (left + right) // 2
        
        if list[middle] == key:
            break
        if list[middle] > key:
            right = middle - 1
        if list[middle] < key:
            left = middle + 1
    return steps

    def best_search(list, key):
    steps_linear = linear_search(list, key)
    steps_binary = binary_search(list, key)
    results = "Linear: " + str(steps_linear) + " steps, "
    results += "Binary: " + str(steps_binary) + " steps. "
    if (steps_linear < steps_binary):
        results += "Best Search is Linear."
    elif (steps_linear > steps_binary):
        results += "Best Search is Binary."
    else:
        results += "Result is a Tie."

    return results

    print(best_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1))
    #Should be: Linear: 1 steps, Binary: 4 steps. Best Search is Linear.

    print(best_search([10, 2, 9, 1, 7, 5, 3, 4, 6, 8], 1))
    #Should be: Linear: 4 steps, Binary: 4 steps. Result is a Tie.

    print(best_search([10, 9, 8, 7, 6, 5, 4, 3, 2, 1], 7))
    #Should be: Linear: 4 steps, Binary: 5 steps. Best Search is Linear.

    print(best_search([1, 3, 5, 7, 9, 10, 2, 4, 6, 8], 10))
    #Should be: Linear: 6 steps, Binary: 5 steps. Best Search is Binary.

    print(best_search([5, 1, 8, 2, 4, 10, 7, 6, 3, 9], 11))
    #Should be: Linear: 10 steps, Binary: 5 steps. Best Search is Binary.

# Module 3 Graded Assessment

## Question 1: What is a regular expression?

    A sequence of characters that forms a search pattern

## Question 2: In regular expressions, what does the re.split() function do? 

    Splits a string into a list of substrings based on a regular expression pattern

## Question 3: You are reading an article that includes some government websites in the form https://www.website-domain.gov. You’d like to make a list of these websites by extracting them from the text automatically, instead of copying and pasting them by hand. 

    Complete the function find_gov_urls to accomplish this task for all websites that end with .gov.

    def find_gov_urls(website):
    pattern = r"https://www\.\w+\.gov" #enter the regex pattern here
    result = re.findall(pattern, website) #enter the re method here
    return result


    print(find_gov_urls("https://www.data.gov is a great place to find open source datasets!")) # Should return ['https://www.data.gov']
    print(find_gov_urls("Learn more about US National Parks at https://www.nps.gov, https://www.nationalparks.org, or https://www.recreation.gov.")) # Should return ['https://www.nps.gov', 'https://www.recreation.gov']
    print(find_gov_urls("The Library of Congress (https://www.loc.gov) is an incredible resource!")) # Should return ['https://www.loc.gov']
    print(find_gov_urls("The Library of Congress (www.loc.gov) is an incredible resource!")) # Should return []

## Question 4: You are working with a dataset on customer orders. This dataset includes a field that contains information on both city and state. You would like to separate this field into two fields, a city field and a state field. In the current field, city and state are separated by either a comma, or a period. Complete the function parse_city_state to split city and state into two strings and return only the state.

    def parse_city_state(text):
    pattern = r"[,\.]" #enter the regex pattern here
    result = re.split(pattern, text) #enter the re method  here
    if len(result) != 2:
    return ""
    return result[1] #return the correct capturing group


    print(parse_city_state("Hamilton, MN")) # should return MN
    print(parse_city_state("Albuquerque, New Mexico")) # should return New Mexico
    print(parse_city_state("Portland. Oregon")) # should return Oregon

## Question 5: International Standard Book Numbers (ISBNs) are used to uniquely identify published books. They follow the 13-digit format XXX-X-XX-XXXXXX-X, where each X represents one numeric digit. You have a list of books, information about those books, and their ISBN numbers. You want to extract the 6 digits of the ISBN that come before the last hyphen of each book’s ISBN number. However, you need to be careful to avoid 6-digit strings that are not part of the ISBN numbers you’re interested in. Complete the find_isbn function so you can use it to extract the 6-digit portion of the ISBN numbers of the books on your list. 

    def find_isbn(list):
    pattern = r"^\d{3}-\d{1}-\d{2}-(\d{6})-\d" #enter the regex pattern here
    result = re.search(pattern, list) #enter the re method  here
    if result is None:
        return ""
    return result[1] #return the correct capturing group


    print(find_isbn("123-4-12-098754-0")) # Should return 098754
    print(find_isbn("223094-AB-30")) # result should be blank
    print(find_isbn("1123-4-12-098754-0")) # result should be blank

## Question 6: In the lab, the variable old_domain_pattern is defined as:  r'' + old_domain + '$'. What information does this variable store?

    A regular expression pattern to identify the old domain

## Question 7: What is the purpose of initializing the old_domain_email_list in the code from the lab?

    To store email addresses with the old domain that match the regex pattern

## Question 8: Why is it important to write the list to an output file in a Python script, as specified by the variable report_file?

    Writing the updated list to an output file provides a permanent record of the changes made, allowing for data preservation and further analysis

## Question 9: Why is it important to replace old domain names with new ones and generate a new file containing all user names with their respective email addresses?

    To enhance data security measures.

## Question 10: You have been tasked with replacing old domain names with new ones in a CSV file using Python, based on the lab. What is the correct sequence of steps to accomplish this task?

    Initialize user_email_list, define headers for the output file, write the updated user_data_list to the output file, and close the CSV file.
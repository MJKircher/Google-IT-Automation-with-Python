# Slow Script with Expensive Loop Exercise. Linux Commands Workflow

    Time ./send_reminders.py “2020-01-13|Example|test1”    <Runs commands and prints how long it took to excute
    
    Real   <Total amount of time took to execute
    
    User   <Time spent in userspace 
    
    Sys    <Time spent doing system-level operations
    
    Time ./send_reminders.py “2020-01-13|Example|test{1..9}”   <Execute with 9 test users
    
    Pprofile3 -f callgrind -o profile.out ./send_reminders.py “2020-01-13|Example|test{1..9}”   <Use python profiler with -f flag to tell it to use the callgrind file format. -o flag to tell it to store the output in profile.out file
    
    Kcachegrind profile.out   <GUI for looking into callgrind format files
    
    GUI shows that the get_name function is using the majority of the resources
    
    Get_name function was opening file for every loop. Also there was no break when match found
    
    Change get_name function to read_name function that reads file once and stores values into dict

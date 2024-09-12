# Slow Web Server Exercise. Linux Commands Workflow

    Wc -l file.csv    <Count number of lines in a file
    
    Head -50 file.csv    <Return first 50 lines in file
    
    Head -50 file.csv | ./import.py     <Pipe first 50 lines to python script
    
    Ab -n 500 site.example.com    <Send 500 request to web server and receive average time
    
    Top     <computer usage stats
    
    Pidof     <Process IDs
    
    For pid in $(pidof ffmpeg): do renice 19 $pid; done    <Update priorities of ffmpeg processes
    
    Ps ax    <Shows all running processes on computer
    
    Ps ax | less     <pipe to less to have access to search functionality
    
    /ffmpeg    <to search through less of all processes for ffmpeg
    
    Locate static/001.webm
    
    Cd into directory
    
    Grep ffmpeg *     <Check which files contain a call to ffmpeg
    
    Killall -STOP ffmpeg     <Just stops. Doesn’t kill processes completely
    
    For pid in $(pidof ffmpeg): do while kill -CONT $pid; do sleep1;; done   <Resume ffmpeg processes

# Debugging Segmentation Fault. Linux Command Workflow

- ./example    run example. Get segmentation fault
- Ulimit -c unlimited   Get core files of any size
- ./example    run example. Get segmentation fault with (core dumped)
- Ls -l core
- Gdb -c core example      give gdb debugger our core file and example to tell debugger where crash is located
- Shows that crash happened at __strlen_avx2() function
- Backtrace   < first element is function where crash occurred. Second element is function which called the first function
- Up       move to the calling function
- List     Shows lines around current up return line
- Print i 
- Print argv[0]
- Print argv[1]     points to null
- Off-by-one-error

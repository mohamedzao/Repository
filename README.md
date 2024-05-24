The design choices of the todo.sh script:

Data Storage:

Each task is stored as a separate text file in a directory specified by the TODO_DIR variable (default is ~/.todo). Storing each task in a separate file simplifies management and makes it easier to manipulate tasks individually.
Task details are stored within each text file in a simple key-value format.
Code Organization:

The script is organized into several functions, each responsible for a specific action (e.g., createtask, updatetask, etc.). This makes the code modular and easier to maintain.
Input validation is performed within each function to ensure the integrity of the data.
The main logic of the script is contained within a case statement, which routes the user's command to the appropriate function.

User Interface:

The script interacts with the user through the terminal using echo and read commands.
Error messages are redirected to standard error (>&2) to differentiate them from regular output.

Running the Program:

To run the program, save the script as todo.sh and make it executable (chmod +x todo.sh).
Execute the script from the terminal, optionally passing one of the available commands as an argument. 
For example: ./todo.sh createtask.










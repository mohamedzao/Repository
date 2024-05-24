Here's a detailed explanation of the design choices for the "todo" program and how to run it:

Design Choices:
Data Storage:

Tasks are stored in a text file named "todo.txt".
Each task is represented as a single line in the file, with fields separated by a delimiter (in this case, '|').
Fields for each task include:
Title: Required for every task.
Description: Additional information about the task.
Location: Where the task needs to be done.
Due Date: Deadline for completing the task.
Completion Marker: Indicates whether the task is completed or not.

Code Organization:

The program is structured around functions to handle different operations.
Each function corresponds to one of the required actions: creating, updating, deleting, showing, listing, or searching for tasks.
Error handling is incorporated to catch invalid input and provide appropriate error messages.
The main part of the program handles command-line arguments and invokes the corresponding function based on the user's input.
User Interaction:

Users interact with the program through the command line interface.
When executing the program without arguments, it defaults to displaying tasks for the current day.
For actions like creating, updating, deleting, or marking tasks as completed, the program prompts the user for necessary information.
Clear and informative messages guide users through the process and inform them about the outcome of their actions.
How to Run the Program:
Download the Script: Obtain the "todo" script file from a trusted source or create it yourself.

Make the Script Executable: Ensure that the script has executable permissions using the chmod command.

chmod +x todo


Run the Program:

To create a task, use the command:
./todo create
To update a task, use:
./todo update
To delete a task, use:
./todo delete
To show information about a task, use:
./todo show <task_id>
To list tasks for a given day, use:
./todo list <date>
To search for a task by title, use:
./todo search <title>
If you run the program without any arguments, it will display completed and uncompleted tasks for the current day.

Follow the Prompts: Provide the required information as prompted by the program, such as task details or task IDs.

Review Results: After each action, review the output to ensure that tasks were created, updated, deleted, or listed as expected.

Summary:
The "todo" program offers a convenient way to manage tasks with various functionalities. By storing tasks in a text file and providing a set of actions to manipulate them, users can efficiently organize their tasks from the command line. With clear prompts and error messages, users can interact with the program seamlessly to accomplish their task management needs.









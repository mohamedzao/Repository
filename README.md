Design Choices:
Function for Factorial Calculation: 
The program defines a factorial function using recursion. This function calculates the factorial of a given number n.

Main Function for User Interaction: The main function is the entry point of the program. It prompts the user to enter a non-negative integer and then calls the factorial function to calculate the factorial of the entered number.

Error Handling: The program includes error handling using a try-except block to handle cases where the user inputs invalid data (e.g., non-integer values).

Data Storage:
There is no explicit data storage in this program. The main computation involves manipulating integers, and the data is stored in local variables (num, result) within the scope of the functions.

Code Organization:
The program consists of two main parts:

The factorial function, responsible for computing the factorial recursively.
The main function, which handles user interaction, input validation, and calling the factorial function.
The script is structured such that the main function is called only if the script is executed directly (i.e., not imported as a module).

How to Run the Program:
To run the program:

Save the script to a file named calculate_factorial.py.
Open a terminal or command prompt.
Navigate to the directory where the script is saved.
Run the script by executing the command: python calculate_factorial.py.
Follow the prompts to enter a non-negative integer.
The program will calculate the factorial of the entered number and display the result.
Summary:
This program is a simple command-line tool for calculating the factorial of a non-negative integer. It follows a modular design, separating the factorial calculation logic from the user interaction logic. Error handling ensures graceful handling of invalid inputs. The program is easy to run and provides clear instructions to the user.






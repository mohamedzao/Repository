
#!/bin/bash


# Function to create a task

createtask() {
echo "Enter id "
read -r id
    echo "Enter task title:"
    read -r title

    echo "Enter task description (optional):"
    read -r description

    echo "Enter task location (optional):"
    read -r location

    # Save the task details to a file
    echo "id: $id" > "file2"
    echo "title: $title" >> "file2"
    echo "description: $description" >> "file2"
    echo "location: $location" >> "file2"
    echo "completed: false" >> "file2"

    echo "Task created successfully!"
}

# Function to update a task
updatetask() {
    echo "Enter the ID of the task you want to update:"
    read -r id

    # Check if the task file exists
    if [[ ! -f "file2" ]]; then
        echo "Task file not found." >&2
        return 1
    fi

    # Check if the task ID exists in the file
    if ! grep -q "^id: $id$" "file2"; then
        echo "Task with ID $id not found." >&2
        return 1
    fi

    echo "Enter new title (leave blank to keep the current title):"
    read -r new_title

    echo "Enter new description (leave blank to keep the current description):"
    read -r new_description

    echo "Enter new location (leave blank to keep the current location):"
    read -r new_location

    # Update task details in the file
    if [[ -n $new_title ]]; then
        sed -i "s/^title: .*/title: $new_title/" "file2"
    fi

    if [[ -n $new_description ]]; then
        sed -i "s/^description: .*/description: $new_description/" "file2"
    fi

    if [[ -n $new_location ]]; then
        sed -i "s/^location: .*/location: $new_location/" "file2"
    fi

    echo "Task with ID $id updated successfully!"
}


# Function to delete a task
deletetask() {
    echo "Enter the ID of the task you want to delete:"
    read -r id

    # Check if the task file exists
    if [[ ! -f "file2" ]]; then
        echo "Task file not found." >&2
        return 1
    fi

    # Check if the task ID exists in the file
    if ! grep -q "^$id:" "file2"; then
        echo "Task with ID $id not found." >&2
        return 1
    fi

    # Delete the task
    sed -i "/^$id:/d" "file2"

    echo "Task with ID $id deleted successfully!"
}

# Function to show all information about a task
showtask() {
    echo "Enter the ID of the task you want to view:"
    read -r id

    # Check if the task file exists
    if [[ ! -f "file2" ]]; then
        echo "Task file not found." >&2
        return 1
    fi

    # Check if the task ID exists in the file
    if ! grep -q "^$id:" "file2"; then
        echo "Task with ID $id not found." >&2
        return 1
    fi

    # Display the task with the specified ID
    grep "^$id:" "file2"

    return 0
}


# Function to list tasks of a given day
listtasks() {
    echo "Enter the date (YYYY-MM-DD) to list tasks for:"
    read -r date_input

    # Check if any task files exist
    if ! ls -A "file2" &> /dev/null; then
        echo "No tasks found." >&2
        return 1
    fi

    # Loop through each task file
    for file in "file2"; do
        # Read the due date from the task file
        read -r _ _ due_date _ < "$file"
        due_date=$(date -d "$due_date" +"%Y-%m-%d")

        # Check if the due date matches the input date
        if [[ $due_date == $date_input ]]; then
            echo "Task: $file"
            cat "$file"
            echo
        fi
    done
}


# Function to search for a task by title
searchtask() {
    echo "Enter the title of the task you want to search for:"
    read -r title

    # Check if any task files exist
    if ! ls -A "file2" &> /dev/null; then
        echo "No tasks found." >&2
        return 1
    fi

    # Loop through each task file
    for file in "file2"; do
        # Check if the title exists in the task file
        if grep -q "^title: $title$" "$file"; then
            echo "Task: $file"
            cat "$file"
            echo
        fi
    done
}


# If no arguments provided, display tasks of the current day
if [[ $# -eq 0 ]]; then
    listtasks
    exit 0
fi

# Main script logic
case $1 in
    "createtask") createtask ;;
    "updatetask") updatetask ;;
    "deletetask") deletetask ;;
    "showtask") showtask ;;
    "listtasks") listtasks ;;
    "searchtask") searchtask ;;
    *) echo "Invalid command. Available commands: createtask, updatetask, deletetask, showtask, listtasks, searchtask" >&2 ;;
esac

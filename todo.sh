
#!/bin/bash


# Function to create a task
createtask() {
    echo "enter task id:"
    read -r id 

    echo "Enter task title:"
    read -r title

   

    echo "Enter task description (optional):"
    read -r description

    echo "Enter task location (optional):"
    read -r location

    # Generate a unique identifier for the task
    id=$(uuidgen)

    # Format the due date and time
    due_date=$(date -d "$due_date_input" +"%Y-%m-%d %H:%M")

    # Save the task details to a file
    echo "id: $id" > "file2"
    echo "title: $title" >> "file2"
    echo "due_date: $due_date" >> "file2"
    echo "description: $description" >> "file2"
    echo "location: $location" >> "file2"
    echo "completed: false" >> "file2"

    echo "Task created successfully!"
}

# Function to update a task
updatetask() {
    echo "Enter the ID of the task you want to update:"
    read -r id

    # Check if the task exists
    if [[ ! -f "file2" ]]; then
        echo "Task not found." >&2
        return 1
    fi

    # Read the task details
    read -r _ title _ < "file2"

    echo "Enter new title (leave blank to keep the current title):"
    read -r new_title
    if [[ -n $new_title ]]; then
        title=$new_title
    fi

    echo "Enter new due date and time (YYYY-MM-DD HH:MM) (leave blank to keep the current due date):"
    read -r new_due_date_input
    if [[ -n $new_due_date_input ]]; then
    
            
            new_due_date=$(date -d "$new_due_date_input" +"%Y-%m-%d %H:%M")
            sed -i "s/due_date: .*/due_date: $new_due_date/" "file2"
        
    fi

    echo "Enter new description (leave blank to keep the current description):"
    read -r new_description
    sed -i "s/description: .*/description: $new_description/" "file2"

    echo "Enter new location (leave blank to keep the current location):"
    read -r new_location
    sed -i "s/location: .*/location: $new_location/" "file2"

    echo "Task updated successfully!"
}

# Function to delete a task
deletetask() {
    echo "Enter the ID of the task you want to delete:"
    read -r id

    # Check if the task exists
    if [[ ! -f "file2" ]]; then
        echo "Task not found." >&2
        return 1
    fi

    rm "file2"
    echo "Task deleted successfully!"
}

# Function to show all information about a task
showtask() {
    echo "Enter the ID of the task you want to view:"
    read -r id

    # Check if the task exists
    if [[ ! -f "$file2" ]]; then
        echo "Task not found." >&2
        return 1
    fi

    cat "file2"
}

# Function to list tasks of a given day
listtasks() {
    echo "Enter the date (YYYY-MM-DD) to list tasks for:"
    read -r date_input

    for file in "file2"; do
        read -r _ _ due_date _ < "$file"
        due_date=$(date -d "$due_date" +"%Y-%m-%d")
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

    for file in "file2"; do
        grep -q "title: $title" "$file" && cat "$file"
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

#!/bin/bash


create_task() {
    echo "Enter task details:"
    read -p "Title (required): " title
    if [[ -z "$title" ]]; then
        echo "Error: Title is required" >&2
        return 1
    fi

    read -p "Description: " description
    read -p "Location: " location
    read -p "Due date (YYYY-MM-DD): " due_date
    if ! [[ $due_date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "Error: Invalid date format. Please use YYYY-MM-DD" >&2
        return 1
    fi

    echo "$title|$description|$location|$due_date|0" >> "$TODO_FILE"
    echo "Task created successfully"
}

display_tasks() {
    if [[ ! -f "$TODO_FILE" ]]; then
        echo "No tasks found"
        return 0
    fi

    while IFS='|' read -r title description location due_date completion; do
        if [[ "$completion" -eq 0 ]]; then
            echo "Title: $title"
            echo "Description: $description"
            echo "Location: $location"
            echo "Due date: $due_date"
            echo "Completion: Uncompleted"
            echo "------"
        fi
    done < "$TODO_FILE"
}

complete_task() {
    display_tasks
    read -p "Enter task number to mark as completed: " task_number
    if [[ ! $task_number =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid input" >&2
        return 1
    fi

    sed -i "${task_number}s/|0$/|1/" "$TODO_FILE"
    echo "Task marked as completed"
}

delete_task() {
    display_tasks
    read -p "Enter task number to delete: " task_number
    if [[ ! $task_number =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid input" >&2
        return 1
    fi

    sed -i "${task_number}d" "$TODO_FILE"
    echo "Task deleted"
}
main() {
    if [[ ! -f "$TODO_FILE" ]]; then
        touch "$TODO_FILE"
    fi

    case "$1" in
        "create")
            create_task
            ;;
        "display")
            display_tasks
            ;;
        "complete")
            complete_task
            ;;
        "delete")
            delete_task
            ;;
        *)
            echo "Usage: $0 {create|display|complete|delete}"
            ;;
    esac
}

main "$@"

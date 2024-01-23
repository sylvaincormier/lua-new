#!/bin/bash

# Check if a project name is provided
if [ $# -eq 0 ]; then
    echo "Please provide a project name."
    exit 1
fi

PROJECT_NAME=$1

# Create a new directory for the project
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

# Create directories for source files and libraries
mkdir src lib

# Initialize a main.lua file
echo "-- main.lua" > src/main.lua
echo "print('Hello, Lua!')" >> src/main.lua

# Optionally initialize LuaRocks (uncomment if needed)
echo "Creating rockspec file..."
echo "package = '$PROJECT_NAME'" > "$PROJECT_NAME-scm-1.rockspec"
echo "version = 'scm-1'" >> "$PROJECT_NAME-scm-1.rockspec"
echo "source = { url = 'git://github.com/user/$PROJECT_NAME' }" >> "$PROJECT_NAME-scm-1.rockspec"
echo "description = { summary = 'Project description.', detailed = [[ Detailed description. ]], homepage = 'http://example.com', license = 'MIT/X11' }" >> "$PROJECT_NAME-scm-1.rockspec"
echo "dependencies = { 'lua >= 5.1' }" >> "$PROJECT_NAME-scm-1.rockspec"
echo "build = { type = 'builtin', modules = { ['$PROJECT_NAME'] = 'src/main.lua' } }" >> "$PROJECT_NAME-scm-1.rockspec"

# Initialize Git repository
git init

# Display project structure
echo "Lua project '$PROJECT_NAME' created."
tree

# End of the script

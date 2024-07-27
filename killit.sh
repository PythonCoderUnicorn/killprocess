#!/bin/bash

# Function to kill a process by name
kill_process() {
  local name="$1"
  local pids=$(pgrep -f "$name")

  if [ -z "$pids" ]; then
    echo "No process found with name: $name"
    return 1
  fi

  echo "Found processes with PIDs: $pids"
  read -p "Enter PID to kill: " pid

  kill "$pid" || sudo kill "$pid"

  if [ $? -eq 0 ]; then
    echo "Process $pid killed successfully 🔪🩸"
  else
    echo "Failed to kill process $pid 🏁"
  fi
}

# Main script
echo "------------------ Kill a Process 🔪 ----"
read -p "Enter process name: " process_name

kill_process "$process_name"  

echo "---------------------------------------"
echo ""

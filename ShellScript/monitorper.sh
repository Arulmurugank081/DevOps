#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 <interval> <output_file>"
    echo "Example: $0 60 performance.log"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Assign arguments to variables
INTERVAL=$1
OUTPUT_FILE=$2

# Function to monitor and log CPU and memory usage
monitor_performance() {
    echo "Timestamp, CPU(%), Memory(%)" >> $OUTPUT_FILE
    while true; do
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
        CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
        MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
        echo "$TIMESTAMP, $CPU_USAGE, $MEM_USAGE" >> $OUTPUT_FILE
        sleep $INTERVAL
    done
}

# Start monitoring
monitor_performance

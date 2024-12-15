# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /usr/src/myapp

# Copy the shell script into the container at /usr/src/app
COPY hello.sh .

# Make the shell script executable
RUN chmod +x hello.sh

# Install necessary packages
RUN apt-get update && apt-get install -y \
    procps  # Required for the 'top' and 'free' commands

# Run the shell script with default arguments
ENTRYPOINT ["./hello.sh"]

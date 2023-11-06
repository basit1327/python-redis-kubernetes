# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the rest of the application code to the working directory
COPY . /app

# Install pipenv and use it to install dependencies
RUN pip install pipenv && pipenv install 

EXPOSE 80

# Command to run the application using pipenv
CMD ["pipenv", "run", "python", "server.py"]

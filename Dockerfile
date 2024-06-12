# Use the official Python image from the Docker Hub
FROM python:3.8

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install Flask directly
RUN pip install flask

# Install curl for health checks
RUN apt-get update && apt-get install -y curl

# Expose port 5000
EXPOSE 5000

# Run the application directly with Python
CMD ["python", "app.py"]

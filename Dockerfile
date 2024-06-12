# Use the official Python image from the Docker Hub
FROM python:3.8

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install Flask and curl
RUN pip install flask && apt-get update && apt-get install -y curl

# Expose port 5000
EXPOSE 5000

# Define a healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=5 \
  CMD curl -f http://localhost:5000/ || exit 1

# Run the application directly with Python
CMD ["python", "app.py"]

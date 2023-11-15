# Use a Debian-based image as the base
FROM debian:bullseye

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install system dependencies, including ping
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    inetutils-ping && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for your application code
WORKDIR /app

# Copy your Flask application code into the container
COPY app.py /app/app.py

# Install Flask and any other Python dependencies
RUN pip3 install Flask

# Expose the port on which your Flask app will run
EXPOSE 5000

# Start your Flask application when the container starts
CMD ["python3", "app.py"]

# Use the official Python image as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install git for the git-revision-date-localized plugin
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /app
COPY . .

# Build the MkDocs site
RUN mkdocs build

# Use the built-in MkDocs server to serve the site
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]

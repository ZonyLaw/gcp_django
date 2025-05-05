# Use a Python base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code into the container
COPY . .

# Set environment variable for production settings
ENV DJANGO_SETTINGS_MODULE=myapp.settings.production

# Expose the port for Cloud Run (which is 8080 by default)
EXPOSE 8080

# Run Gunicorn to serve the app
CMD ["gunicorn", "myapp.wsgi:application", "--bind", "0.0.0.0:8080"]

# Use a Python base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Gunicorn for production server
RUN pip install gunicorn

# Copy the rest of the app code into the container
COPY . .

# Set environment variable for production settings (update the settings module name as per your project structure)
ENV DJANGO_SETTINGS_MODULE=myapp.settings.production

# Expose the port for Cloud Run (which is 8080 by default)
EXPOSE 8080

# Set the command to run the application with Gunicorn
CMD ["gunicorn", "myapp.wsgi:application", "--bind", "0.0.0.0:8080"]

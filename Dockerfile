FROM python:3.10-slim

# Set the working directory to match the project name
WORKDIR /Docker-project-1

# Copy application files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port for any API (if extended in the future)
EXPOSE 8000

# Run the application
CMD ["python", "app.py"]



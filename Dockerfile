# Dockerfile

# CORRECTED: Using the Amazon ECR Public Gallery URI for the Python image 
# to bypass Docker Hub rate limits for AWS services.
FROM public.ecr.aws/docker/library/python:3.10-slim

WORKDIR /app

# Best practice: Copy only what's necessary for installation first
COPY requirements.txt .
# Run pip install 
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the application port (assuming your Flask/other app runs on 5000)
EXPOSE 5000

# Specify the command to run the application
CMD ["python", "app.py"]
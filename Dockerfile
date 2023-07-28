# Use a Python base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy the repository contents into the container
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Set entry point for running tests
ENTRYPOINT ["pytest", "-v", "-s", "--capture=tee-sys", "./test.py", "--html=report.html"]

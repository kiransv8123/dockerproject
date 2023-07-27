# Use a Python base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the test script and other necessary files to the container
COPY test.py .
COPY send_email_script.py .

# Set up any additional configurations for Selenium, if needed

# Set the entrypoint to run the Pytest command
ENTRYPOINT ["pytest", "-v", "-s", "--capture=tee-sys", "./test.py", "--html=report.html"]

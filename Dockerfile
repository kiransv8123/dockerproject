# Stage 1: Build the application and install dependencies
FROM python:3.9 AS builder

WORKDIR /app

# Copy only the dependency files first to leverage Docker layer caching
COPY requirements.txt .

# Install the dependencies (this layer will be cached if requirements.txt hasn't changed)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Build your application (if applicable)

# Stage 2: Create the final image with only the built artifacts and necessary dependencies
FROM python:3.9-slim

WORKDIR /app

# Copy only the built artifacts and the installed dependencies from the previous stage
COPY --from=builder /app .

# Run your application (or tests in your case)
CMD ["python", "test.py"]

# Step 1: Use an official Python image
FROM python:3.9-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy files into the container
COPY . /app

# Step 4: Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Expose port 5000
EXPOSE 5000

# Step 6: Run the app
CMD ["python", "app.py"]

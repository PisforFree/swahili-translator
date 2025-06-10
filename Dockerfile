
# Step 1: Use an official image as the base
FROM python:3.9-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the current directory contents into the container
COPY . /app

# Step 4: Install any Python dependencies from requirements.txt
RUN pip install -r requirements.txt

# Step 5: Make port 5000 available to the world outside this container
EXPOSE 5000

# Step 6: Define the command to run your app
CMD ["python", "app.py"]


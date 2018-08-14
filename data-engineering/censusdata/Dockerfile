# Use an official Python runtime as a parent image
FROM python:3.7.0-slim

# Set the working directory to /app
WORKDIR /censusdata

# Copy the current directory contents into the container at /app
COPY . /censusdata

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Run app.py when the container launches
CMD ["python", "datapickle.py"]

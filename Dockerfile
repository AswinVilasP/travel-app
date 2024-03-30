# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set work directory
WORKDIR /app

# Copy project
COPY . /app/

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

RUN chmod +x entrypoint.sh

# Run the application
CMD ["/app/entrypoint.sh"]

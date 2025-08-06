# Use official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r -- upgrade /app/requirements.txt

# Copy source code
COPY . .

# Expose port
ENV PORT 5000
EXPOSE 5000

# Start the app with gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
docker build -t my-flask-app
# Inherit python image
FROM python:3.6-slim

# Set up directories
RUN mkdir /application
WORKDIR /application

# Copy python dependencies and install these
COPY requirements.txt .
RUN pip install -r requirements.txt
# Copy the rest of the applicationssd
COPY . .

# Environment variables
ENV PYTHONUNBUFFERED 1

# EXPOSE port 5000 to allow communication to/from server
EXPOSE 5000
STOPSIGNAL SIGINT

ENTRYPOINT ["python"]
CMD ["flask_app.py"]

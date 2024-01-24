FROM python:latest

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the Pipfile and Pipfile.lock to the working directory
COPY Pipfile Pipfile.lock /app/

# Install dependencies using Pipenv
RUN pip install pipenv && pipenv install --deploy --ignore-pipfile

# Copy the Django application code to the container
COPY ./ /app/

# Expose the port that the Django development server will run on
EXPOSE 9000

# Start the Django development server
CMD ["pipenv", "run", "python", "manage.py", "runserver", "0.0.0.0:9000"]
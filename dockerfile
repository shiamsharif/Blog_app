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



#Build Command: docker build -t<tag> <image_name> .<current_directory>
#EX:               docker build -t img_name .

#Run command: docker run -d<to run in bg> -p<port host_port:container_port> --name <container_name> img_name
#Ex:              docker run -d -p 8000:8000 --name blog(name)img_name 

# docker images  (all existing images)
# docker ps  (for watching running containers).
# docker ps -a  (for running and stop)
# docker rm <container id>  (to remove stop container)
# docker rmi <image id>  (to remove img) 
# docker rm <container id> -f  (to force full remove container)



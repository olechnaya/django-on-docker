# pull official base image
FROM python:3.11.4-slim-buster

# instruction sets the working directory 
# for any RUN, CMD, ENTRYPOINT, COPY and ADD 
#  instructions that follow it in the Dockerfile.
#  If the WORKDIR doesn’t exist, it will be created 
# even if it’s not used in any subsequent 
# Dockerfile instruction.
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt


# copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh
# Установка netcat
RUN apt-get update && apt-get install -y netcat

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

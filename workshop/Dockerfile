# Base image
FROM python:2.7-slim

# updating repository sources
RUN apt-get update -y  

# Creating directories
RUN mkdir /data 
RUN mkdir /notbooks

# installing cron and curl
RUN apt-get install cron -yqq \
    curl

# Jupyter
EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='demo'

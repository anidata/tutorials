# Base image
#FROM python:3-slim
FROM jupyter/minimal-notebook

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    unzip \
    nano \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# updating repository sources
# RUN apt-get update -y  

# Creating directories
 RUN mkdir /data 
 RUN mkdir /notbooks

# installing cron and curl
#RUN apt-get install cron -yqq \
#    curl

# Jupyter
EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='demo'

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

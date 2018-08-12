# Base image
#FROM python:3-slim
FROM jupyter/minimal-notebook

USER root

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt \
        && rm /tmp/requirements.txt

COPY bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

ENTRYPOINT /bootstrap.sh

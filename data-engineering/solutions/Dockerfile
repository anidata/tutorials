FROM python:3-slim

WORKDIR /root

COPY requirements.txt /root/requirements.txt

RUN pip install -r /root/requirements.txt

COPY label.py /root/label.py
COPY bag.py /root/bag.py

ENTRYPOINT ["python3"]
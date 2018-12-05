FROM python:3.7.1
WORKDIR /root
ADD requirements.txt /root/
RUN pip install -r requirements.txt
ADD run.py .
ADD starter_pack starter_pack
CMD python run.py

FROM python:3.7.1
WORKDIR /root
RUN pip install gunicorn
ADD requirements.txt /root/
RUN pip install -r requirements.txt
ADD run.py .
ADD gunicorn_conf.py .
ADD starter_pack starter_pack
CMD gunicorn --config python:gunicorn_conf run:app

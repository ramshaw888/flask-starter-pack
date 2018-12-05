FROM python:3.7.1
RUN pip install pipenv
WORKDIR /root
ADD Pipfile* /root/
RUN pipenv install --three
ADD run.py .
ADD starter_pack starter_pack
CMD pipenv run python run.py

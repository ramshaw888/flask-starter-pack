FROM python:3.7.0
RUN pip install --user pipenv
WORKDIR ~
ADD Pipfile.lock .
ADD Pipfile .
ENV PATH="/root/.local/bin:${PATH}"
RUN pipenv install --three
ADD run.py .
ADD starter_pack starter_pack
CMD pipenv run python run.py

#ADD starter_pack /starter_pack

import os


worker_class = "gevent"
workers = 1
worker_connections = 1000  # applicable for gevent
backlog = 2048  # ?
timeout = 30
loglevel = 'DEBUG'

bind = os.environ.get("APP_GUNICORN_BIND", "0:8000")
accesslog = "-"
errorlog = "-"

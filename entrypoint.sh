#!/bin/sh

ln -s /opt/testProjectMagnificode/.env testProjectMagnificode/.env

echo "Collect static files"
python manage.py collectstatic --noinput -c

echo "Create cache table"
python manage.py createcachetable

echo "Apply database migrations"
python manage.py migrate

echo "Starting server"
gunicorn testProjectMagnificode.asgi:application -k uvicorn.workers.UvicornWorker -b 0.0.0.0:80

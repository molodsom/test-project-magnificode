FROM python:3.11-alpine

ENV PYTHONUNBUFFERED=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1

COPY testProjectMagnificode testProjectMagnificode
COPY manage.py requirements.txt entrypoint.sh ./
WORKDIR .

RUN apk add git gcc rust libpq-dev --no-cache && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt && \
    apk del git gcc rust

CMD ["./entrypoint.sh"]

EXPOSE 80

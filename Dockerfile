FROM python:alpine

ENV OSINT_DOCKER=True

LABEL maintainer="sushibox.io"

COPY . /app
WORKDIR /app

RUN \
  pip3 install -r requirements.txt
  chmod +x install.sh
  chmod +x MrHolmes.py
  bash install.sh

CMD [ "python3", "MrHolmes.py" ]

VOLUME /config
EXPOSE 7373

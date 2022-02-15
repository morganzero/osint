FROM ghcr.io/linuxserver/baseimage-alpine:3.15

ENV OSINT_DOCKER=True

LABEL maintainer="sushibox.io"

RUN \
  apk --quiet --no-cache --no-progress update && apk --quiet --no-cache --no-progress upgrade && \
  apk add -U --update --no-cache git py3-pip python3-dev whois iputils tcptraceroute php && \
  python3 -m pip install --upgrade pip && \
  pip3 install -r requirements.txt && \
  chmod +x install.sh && chmod +x MrHolmes.py && \
  apk del --purge build-dependencies && apk del --quiet --clean-protected --no-progress && rm -f /var/cache/apk/*

COPY . /app

VOLUME /config
EXPOSE 7373

CMD [ "python3", "MrHolmes.py" ]

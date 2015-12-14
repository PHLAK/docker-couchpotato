FROM alpine:3.2
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewciz.com>

# Set CouchPotato directory
ENV CP_DIR /opt/CouchPotatoServer

# Install dependencies
RUN apk add --update ca-certificates gcc jq libffi-dev libxml2-dev libxslt-dev \
    musl-dev openssl-dev python py-openssl py-pip tar wget \
    && rm -rf /var/cache/apk/*

RUN pip install lxml pyOpenSSL

# Creat directory
RUN mkdir -p ${CP_DIR}

# Download and extract CouchPotato archive
RUN CP_TARBALL=$(wget -qO- https://api.github.com/repos/RuudBurger/CouchPotatoServer/releases | jq -r '.[0].tarball_url') \
    && wget -qO- ${CP_TARBALL} \
    | tar -xz --strip-components=1 -C ${CP_DIR}

# Expose port
EXPOSE 5050

# Set default command
CMD python ${CP_DIR}/CouchPotato.py --console_log

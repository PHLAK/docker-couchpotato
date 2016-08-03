FROM alpine:3.4
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewciz.com>

# Define CouchPotato version
ENV CP_VERSION 3.0.1

# Create CouchPotato directories
RUN mkdir -p /opt/couchpotato

# Set CouchPotato archive URL
ENV TARBALL_URL https://api.github.com/repos/RuudBurger/CouchPotatoServer/tarball/build/${CP_VERSION}

# Download and extract CouchPotato archive
RUN apk add --update ca-certificates gcc libffi-dev libxml2-dev libxslt-dev \
    musl-dev openssl-dev python-dev py-openssl py-pip tar wget \
    && wget -qO- ${TARBALL_URL} | tar -xz --strip-components=1 -C /opt/couchpotato \
    && apk del --purge tar wget && rm -rf /var/cache/apk/*

# Install pip-managed dependencies
RUN pip install --no-cache-dir lxml pyOpenSSL

# Expose port
EXPOSE 5050

# Set default command
CMD ["/opt/couchpotato/CouchPotato.py", "--console_log"]

FROM alpine:3.2
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewciz.com>

# Define CouchPotato version
ENV CP_VERSION 3.0.1

# Create CouchPotato directories
RUN mkdir -p /opt/couchpotato

# Install dependencies
RUN apk add --update ca-certificates gcc libffi-dev libxml2-dev libxslt-dev \
    musl-dev openssl-dev python py-openssl py-pip tar wget \
    && rm -rf /var/cache/apk/*

# Install pip-managed dependencies
RUN pip install --no-cache-dir lxml pyOpenSSL

# Set CouchPotato archive URL
ENV TARBALL_URL https://api.github.com/repos/RuudBurger/CouchPotatoServer/tarball/build/${CP_VERSION}

# Download and extract CouchPotato archive
RUN wget -qO- ${TARBALL_URL} | tar -xz --strip-components=1 -C /opt/couchpotato

# Expose port
EXPOSE 5050

# Set default command
CMD ["/opt/couchpotato/CouchPotato.py", "--console_log"]

FROM alpine:3.2
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewciz.com>

# Set CouchPotato directory
ENV CP_DIR /opt/CouchPotatoServer

# Upgrade packages and install dependencies
RUN apk add --update ca-certificates gcc libffi-dev libxml2-dev musl-dev openssl-dev \
    python py-openssl py-pip tar wget \
    && rm -rf /var/cache/apk/*

RUN pip install pyOpenSSL

# Creat directory
RUN mkdir -p ${CP_DIR}

# Download and extract CouchPotato archive
RUN wget -qO- https://github.com/RuudBurger/CouchPotatoServer/archive/build/3.0.1.tar.gz \
    | tar -xz --strip-components=1 -C ${CP_DIR}

# Expose port
EXPOSE 5050

# Set default command
CMD python ${CP_DIR}/CouchPotato.py --console_log

docker-couchpotato
==================

Docker image for CouchPotato server

[![](https://images.microbadger.com/badges/image/phlak/couchpotato.svg)](http://microbadger.com/#/images/phlak/couchpotato "Get your own image badge on microbadger.com")

-----

**!!! UNMAINTAINED !!!**

I will no longer be maintaining this image and recommend using the
[`linuxserver/couchpotato`](https://hub.docker.com/r/linuxserver/couchpotato/)
image if you would like to run CouchPotato on Docker.

-----

### Running the container

    docker run -d -p 5050:5050 --restart=always --name couchpotato phlak/couchpotato

Troubleshooting
---------------

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-couchpotato/issues).

Copyright
---------

This project is licensed under the [MIT License](https://github.com/PHLAK/docker-couchpotato/blob/master/LICENSE).

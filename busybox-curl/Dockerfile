FROM busybox

WORKDIR /data

RUN wget http://www.magicermine.com/demos/curl/curl/curl-7.30.0.ermine.tar.bz2 -O /data/curl.tar.bz2 \
	&& tar -xvf curl.tar.bz2 \
	&& mv /data/curl-7.30.0.ermine/curl.ermine /bin/curl \
    && rm -f curl.tar.bz2 && rm -rf /data/curl-7.30.0.ermine

CMD ["/bin/sh"]

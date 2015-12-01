FROM dockerhub.zanox.com:5000/zanox/php4

#RUN pecl config-set preferred_state beta
#RUN pecl -d memory_limit="512M" install xhprof
#RUN pecl -v download xhprof
#RUN pear -v install xhprof
#RUN pecl config-set preferred_state stable
RUN bash install-pecl-module.sh xhprof 0.9.4
#COPY docker/config/xhprof.ini /usr/local/etc/php/conf.d/xhprof.ini

# Copy source code in
COPY docker/config/xhprof.conf /etc/apache2/sites-enabled/xhprof.conf

WORKDIR /home/sites/xhprof
RUN \
    mkdir /var/tmp/xhprof && chmod 777 /var/tmp/xhprof && \
    ln -s /usr/local/lib/php/xhprof_lib xhprof_lib && \
    ln -s /usr/local/lib/php/xhprof_html xhprof_html

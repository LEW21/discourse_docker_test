FROM samsaffron/discourse:0.2.5

RUN ln -s /app/discourse.conf /var/www/discourse/config/

ADD app /app
WORKDIR /app

VOLUME /shared

ENV LANG en_US.UTF-8

ENV RAILS_ENV production

# How many concurrent web requests are supported?
# With 2GB we recommend 3-4 workers, with 1GB only 2
ENV UNICORN_WORKERS 2
ENV UNICORN_SIDEKIQS 1

# slightly less aggressive than "recommendation" but works fine with oobgc
ENV RUBY_GC_MALLOC_LIMIT 40000000

# this ensures we have enough heap space to handle a big pile of small reqs
ENV RUBY_HEAP_MIN_SLOTS 800000


ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/sbin/runit"]

FROM samsaffron/discourse:0.2.5

ADD app /app
WORKDIR /app

VOLUME /shared

ENV RAILS_ENV production
# How many concurrent web requests are supported?
# With 2GB we recommend 3-4 workers, with 1GB only 2
ENV UNICORN_WORKERS 3
ENV UNICORN_SIDEKIQS 1
# slightly less aggressive than "recommendation" but works fine with oobgc
ENV RUBY_GC_MALLOC_LIMIT 40000000
# this ensures we have enough heap space to handle a big pile of small reqs
ENV RUBY_HEAP_MIN_SLOTS 800000

ENV DISCOURSE_DB_SOCKET /var/run/postgresql
ENV DISCOURSE_DB_HOST
ENV DISCOURSE_DB_PORT


ENV LANG en_US.UTF-8

## List of comma delimited emails that will be made admin on signup
ENV DISCOURSE_DEVELOPER_EMAILS my-email-address@example.com

## The domain name this Discourse instance will respond to
ENV DISCOURSE_HOSTNAME discourse.example.com

## The mailserver this Discourse instance will use
ENV DISCOURSE_SMTP_ADDRESS smtp.example.com          # (mandatory)
ENV DISCOURSE_SMTP_PORT # 587                        # (optional)
ENV DISCOURSE_SMTP_USER_NAME # user@example.com      # (optional)
ENV DISCOURSE_SMTP_PASSWORD # p@ssword               # (optional)

## the origin pull CDN address for this Discourse instance
ENV DISCOURSE_CDN_URL # //discourse-cdn.example.com


ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/sbin/runit"]

FROM samsaffron/discourse:0.2.5

ADD app /app
WORKDIR /app

VOLUME /shared

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/sbin/runit"]

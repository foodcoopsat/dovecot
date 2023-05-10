# Newer versions have a problem with OAuth2 login
FROM alpine:3.18

RUN apk add --no-cache \
    dovecot dovecot-lmtpd dovecot-pop3d dovecot-submissiond dovecot-pgsql \
    dovecot-pigeonhole-plugin rspamd-client xapian-core \
    && rm -rf /etc/dovecot/* \
    && mkdir /mail \
    && chown mail:mail /mail

COPY --chown=mail:mail sieve/*.sieve /usr/lib/dovecot/sieve/
COPY --chown=mail:mail sieve-execute/* /usr/lib/dovecot/sieve-execute/

CMD ["dovecot", "-F"]

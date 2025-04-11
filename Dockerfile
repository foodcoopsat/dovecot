# Newer versions have a problem with OAuth2 login
FROM alpine:3.14

RUN apk add --no-cache \
    dovecot dovecot-lmtpd dovecot-pop3d dovecot-submissiond dovecot-pgsql \
    dovecot-pigeonhole-plugin rspamd-client xapian-core \
    && rm -rf /etc/dovecot/* \
    && mkdir /mail \
    && chown mail:mail /mail

COPY --chown=mail:mail sieve/*.sieve /usr/lib/dovecot/sieve/
COPY --chown=mail:mail sieve-execute/* /usr/lib/dovecot/sieve-execute/
RUN sievec /usr/lib/dovecot/sieve/before.sieve \
    && sievec /usr/lib/dovecot/sieve/after.sieve


CMD ["dovecot", "-F"]

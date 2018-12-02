#!/bin/sh


# Copy data from dokuwiki if 'copied' file does't exist
# Works but must be improved.
if ! [ -f 'copied' ] ; then
  cp -r /var/www/dokuwiki/* /var/www/html/ && touch /var/www/html/copied
fi

chown -R "${PUID}:${PGID}" /var/www/html \
&& php-fpm7 && nginx -g 'daemon off;'

#!/bin/sh

# Copy data from dokuwiki if 'copied' file does't exist
# Works but must be improved.
if ! [ -f 'copied' ] ; then
  cp -rp /var/www/dokuwiki-release_stable_${DOKUWIKI_VERSION}/* /var/www/html/ && \
  chown -R "${DOKUWIKI_USER}:${DOKUWIKI_GROUP}" /var/www/html && \
  touch /var/www/html/copied
fi

php-fpm7 && nginx -g 'daemon off;'

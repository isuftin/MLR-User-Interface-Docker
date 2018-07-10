#!/bin/sh
set -e

if [ -n "${OAUTH_CLIENT_SECRET_PATH}" ] && [ -f "${OAUTH_CLIENT_SECRET_PATH}" ]; then
  oauthClientSecret=$(cat ${OAUTH_CLIENT_SECRET_PATH})
  else
  	echo "oauthClientSecret is not defined"
  	exit 0
fi

java -Djava.security.egd=file:/dev/./urandom -DoauthClientSecret=$oauthClientSecret -DkeystorePassword=$keystorePassword -jar app.jar $@

exec env "$@"

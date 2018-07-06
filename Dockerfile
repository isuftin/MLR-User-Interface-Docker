FROM openjdk:8-jdk-alpine
RUN set -x & apk update && apk upgrade && apk add --no-cache curl && apk --no-cache add openssl
ARG mlr_version

ADD docker-entrypoint.sh entrypoint.sh
RUN ["chmod", "+x", "entrypoint.sh"]

RUN  curl -k -X GET "https://cida.usgs.gov/artifactory/mlr-maven-centralized/gov/usgs/wma/mlrInterface/$mlr_version/mlrInterface-$mlr_version.war" > app.war
EXPOSE 8443
ENTRYPOINT [ "/entrypoint.sh" ]

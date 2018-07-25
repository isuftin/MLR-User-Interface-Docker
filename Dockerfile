FROM cidasdpdasartip.cr.usgs.gov:8447/wma/wma-spring-boot-base:latest

ENV repo_name=mlr-maven-centralized
ENV artifact_id=mlrInterface
ENV artifact_version=0.2-SNAPSHOT
ENV serverPort=8444
ENV oauthClientId=client-id
ENV oauthClientAccessTokenUri=https://example.gov/oauth/token
ENV oauthClientAuthorizationUri=https://example.gov/oauth/authorize
ENV oauthResourceTokenKeyUri=https://example.gov/oauth/token_key
ENV oauthResourceId=resource-id
ENV MLR_GATEWAY_HOST=https://localhost
ENV MLR_GATEWAY_PORT=6026
ENV MLR_GATEWAY_UPLOAD_PATH=/workflows/ddots
ENV MLR_GATEWAY_VALIDATE_PATH=/workflows/ddots/validate
ENV HEALTHY_RESPONSE_CONTAINS='{"status":"UP"}'

RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.wma ${artifact_id} ${artifact_version} app.war war

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -k "https://127.0.0.1:${serverPort}${serverContextPath}${HEALTH_CHECK_ENDPOINT}" | grep -q ${HEALTHY_RESPONSE_CONTAINS} || exit 1

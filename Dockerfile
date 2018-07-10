FROM cidasdpdasartip.cr.usgs.gov:8447/aqcu/aqcu-base:latest

ENV repo_name=mlr-maven-centralized
ENV artifact_id=mlrNotification
ENV artifact_version=0.7.0-SNAPSHOT
RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.wma ${artifact_id} ${artifact_version} app.jar

ADD launch-app.sh launch-app.sh
RUN ["chmod", "+x", "launch-app.sh"]

#Default ENV Values
ENV serverPort=443
ENV oauthClientId=client-id
ENV oauthClientAccessTokenUri=https://example.gov/oauth/token
ENV oauthClientAuthorizationUri=https://example.gov/oauth/authorize
ENV oauthResourceTokenKeyUri=https://example.gov/oauth/token_key
ENV oauthResourceId=resource-id

ENV MLR_NOTIFICATION_SERVICE_PWD=fakepassword
ENV MLR_NOTIFICATION_EMAIL_FROM=fakeperson@usgs.gov
ENV MLR_NOTIFICATION_EMAIL_HOST=fakehost
ENV MLR_NOTIFICATION_EMAIL_PORT=9999

ENV OAUTH_CLIENT_SECRET_PATH=/oauthClientSecret.txt

ENV HEALTHY_RESPONSE_CONTAINS='{"status":"UP"}'

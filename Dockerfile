FROM mhart/alpine-node:12
ARG SA_EMAIL
ARG GOOGLE_APPLICATION_CREDENTIALS
ARG PROJECT_ID
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bin/sh", "-c", "echo", "HIHIHIHIHI"]

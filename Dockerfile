FROM mhart/alpine-node:12
ARG SA_EMAIL
ARG GOOGLE_APPLICATION_CREDENTIALS
ARG PROJECT_ID
RUN echo $GOOGLE_APPLICATION_CREDENTIALS > sa_key.json
COPY ./entrypoint ./entrypoint
ENTRYPOINT ["bin/sh", "-c", "./entrypoint.sh"]

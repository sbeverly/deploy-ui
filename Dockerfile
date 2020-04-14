FROM mhart/alpine-node:12
ARG SA_EMAIL
ARG GOOGLE_APPLICATION_CREDENTIALS
ARG PROJECT_ID
RUN echo $GOOGLE_APPLICATION_CREDENTIALS > sa_key.json
RUN ls ./
COPY ./entrypoint.sh ./entrypoint.sh
ENTRYPOINT ["bin/sh", "-c", "./entrypoint.sh"]

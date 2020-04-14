FROM mhart/alpine-node:12
ARG SA_EMAIL
ARG GOOGLE_APPLICATION_CREDENTIALS
ARG PROJECT_ID
RUN echo $GOOGLE_APPLICATION_CREDENTIALS > sa_key.json
RUN gcloud auth activate-service-account $SA_EMAIL --project=$PROJECT_ID --key-file=./sa_key.json
ENTRYPOINT ["bin/sh", "-c", "./deploy.sh"]

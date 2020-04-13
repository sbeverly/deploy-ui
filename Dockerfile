FROM mhart/alpine-node:12
RUN npm ci --prod
RUN npm run-script build

FROM google/cloud-sdk:alpine
ARG SA_EMAIL
ARG GOOGLE_APPLICATION_CREDENTIALS
ARG PROJECT_ID
COPY --from=0 ./build ./build
COPY --from=0 ./deploy.sh ./
RUN echo $GOOGLE_APPLICATION_CREDENTIALS > sa_key.json
RUN gcloud auth activate-service-account $SA_EMAIL --project=$PROJECT_ID --key-file=./sa_key.json
ENTRYPOINT ["bin/sh", "-c", "./deploy.sh"]

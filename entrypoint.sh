#!/bin/bash
set -e

if [[ $INPUT_SA_EMAIL ]]; then gcloud auth activate-service-account $INPUT_SA_EMAIL --key-file ./sa_key.json --project-id $INPUT_PROJECT_ID; fi

npm ci --prod
npm run-script build

echo $INPUT_SA_EMAIL
echo $INPUT_PROJECT_ID

gsutil -h "Cache-Control: no-cache, max-age=0, must-revalidate" rsync -rd ./build/ $INPUT_GS_URL

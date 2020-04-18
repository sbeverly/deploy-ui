#!/bin/bash
set -e

echo "VARS"
echo $1
echo $2
echo "END VARS"

if [[ $1 ]]; then gcloud auth activate-service-account $1 --key-file /sa_key.json --project $3; fi

npm ci --prod
npm run-script build

gsutil -h "Cache-Control: no-cache, max-age=0, must-revalidate" rsync -rd ./build/ $4

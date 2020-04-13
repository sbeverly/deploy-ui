#!/bin/bash
set -e

if [[ $1 ]]; then gcloud auth activate-service-account $1 --key-file $2 --project-id $3; fi

gsutil -h "Cache-Control: no-cache, max-age=0, must-revalidate" rsync -rd build/ gs://login.siyan.io

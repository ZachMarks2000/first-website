#!/usr/bin/env bash
set +x #xtrace
set +v #verbose
set -e #errexit
set -u #nounset

region='us-east-1'
export AWS_DEFAULT_REGION=$region
export AWS_REGION=$region

set -x

aws cloudformation deploy \
  --region ${region} \
  --template-file cfn/infra.yaml \
  --stack-name first-website \
  --tags \
      zmarks:team=zmarks \
      zmarks:product=first-website.com \
      zmarks:stage=dev \
      zmarks:createdBy=${USER}

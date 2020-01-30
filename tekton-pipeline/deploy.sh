#!/bin/bash
tput reset
git add *
git commit -m "12th commit"
git push
oc apply -f pipeline/pipeline.yaml
oc apply -f task/build-src-code.yaml 
oc delete pr application-pipeline-run
oc apply -f pipeline/pipeline-run.yaml


#!/bin/bash
tput reset
cd ..
git add *
git commit -m "12th commit"
git push
cd tekton-pipeline
oc apply -f pipeline/pipeline.yaml
oc apply -f task/build-src-code.yaml 
oc apply -f task/deploy-to-cluster.yaml 
oc delete pr application-pipeline-run
oc apply -f pipeline/pipeline-run.yaml


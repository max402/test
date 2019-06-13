#!/usr/bin/env bash
set PROJECT_VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
echo $PROJECT_VERSION
oc login https://openshift.adorsys.de:443 --username=$OPENSHIFT_USER --password=$OPENSHIFT_PASSWORD
docker login -u $(oc whoami) -p $(oc whoami -t) https://openshift-registry.adorsys.de
docker build -t test:$TRAVIS_COMMIT --build-arg JAR_FILE=test-$PROJECT_VERSION.jar .
#export IMAGE_NAME=openshift-registry.adorsys.de/datasafe/datasafe-rest-service
#docker tag datasafe-rest-service:$TRAVIS_COMMIT $IMAGE_NAME:$TRAVIS_COMMIT
#docker push $IMAGE_NAME:$TRAVIS_COMMIT
#oc tag $IMAGE_NAME:$TRAVIS_COMMIT datasafe-rest-service:latest
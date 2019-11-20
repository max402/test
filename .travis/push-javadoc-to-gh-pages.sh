#!/bin/bash

if [[ "$TRAVIS_REPO_SLUG" == "max402/test"
    && "$TRAVIS_JDK_VERSION" == "openjdk8"
    && "$TRAVIS_PULL_REQUEST" == "false"
    && "$TRAVIS_BRANCH" == "master" ]];
then

  echo -e "Publishing javadoc...\n"

  cp -R target/site/apidoc $HOME/javadoc-latest
  pwd
  ls target
  ls target/site

  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "travis-ci"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/max402/test gh-pages > /dev/null

  cd gh-pages
  git rm -rf ./javadoc
  cp -Rf $HOME/javadoc-latest ./javadoc
  git add -f .
  git commit -m "Latest javadoc on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
  git push -fq origin gh-pages > /dev/null

  echo -e "Published Javadoc to gh-pages.\n"

fi

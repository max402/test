#!/bin/bash

if [[ "$TRAVIS_REPO_SLUG" == "max402/test"
    && "$TRAVIS_JDK_VERSION" == "openjdk8"
    && "$TRAVIS_PULL_REQUEST" == "false"
    && "$TRAVIS_BRANCH" == "master" ]];
then

  echo -e "Publishing javadoc...\n"

  echo '$PWD is' $PWD
  echo '$HOME is' $HOME
  echo 'command pwd' pwd

  pushd $HOME
  git clone --quiet --branch=gh-pages https://${GITHUB_TOKEN}@github.com/max402/test gh-pages > /dev/null
  cd gh-pages
  cp -Rf target/site/apidocs ./javadoc/$TRAVIS_TAG
  ln -s ./javadoc/$TRAVIS_TAG ./javadoc/latest

  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "travis-ci"
  git add -f .
  git commit -m "Latest javadoc on successful travis build $TRAVIS_BUILD_NUMBER for tag $TRAVIS_TAG auto-pushed to gh-pages"
  git push -fq origin gh-pages > /dev/null

  echo -e "Published Javadoc to gh-pages.\n"
  popd
fi

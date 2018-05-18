#!/bin/sh

case $TRAVIS_OS_NAME in
  linux)
    sudo apt-get install coinor-libclp-dev coinor-libcbc-dev coinor-libsymphony-dev mccs
    ;;
  osx)
    if [ -n "$MCCS_BACKENDS" ] ; then
      rm /usr/local/include/c++
      brew tap coin-or-tools/coinor
      BACKEND_PACKAGES="cbc clp symphony"
    else
      BACKEND_PACKAGES=
    fi
    brew install diffutils $BACKEND_PACKAGES
    ;;
  *)
    echo "Unknown TRAVIS_OS_NAME: $TRAVIS_OS_NAME" >&2
    exit 2
    ;;
esac

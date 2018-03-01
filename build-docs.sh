#!/bin/bash
set -ex

BUILD_DIR=build 
GIT_COMMIT_SHA=$(git rev-parse --short HEAD)
GIT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD | sed 's#/#_#g')
TARGET_DIR=${TARGET_DIR:-$HOME/git/docs}

rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}

if [ "${GIT_BRANCH_NAME}" == "HEAD" ]; then
  echo "headless build, exiting..."
  exit 1
fi

VERSIONED_BUILD_DIR="${BUILD_DIR}/v/${GIT_BRANCH_NAME}"
mkdir -p ${VERSIONED_BUILD_DIR}

gitbook build . ${VERSIONED_BUILD_DIR}
cp book.json ${VERSIONED_BUILD_DIR}

rsync -a --delete ${VERSIONED_BUILD_DIR}/* ${TARGET_DIR}/v/${GIT_BRANCH_NAME}

if [ -n "${LINK_TO_ROOT}" ]; then
  pushd ${TARGET_DIR}/v
  ln -sf ${GIT_BRANCH_NAME} current
  popd
fi

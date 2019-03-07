#!/bin/bash
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Constants
REQUIRED_PROTOC_VERSION="libprotoc 3.6.1"
# TODO: move this to googleapis/api-common-protos.git when it becomes the SOT.
COMMON_PROTOS_REPO="https://github.com/googleapis/googleapis.git"

# Directories
: "${ROOT_DIR:=$(pwd)}"
echo "root dir: ${ROOT_DIR}"
TEMP_COMMON_PROTOS_DIR="${ROOT_DIR}/tmp_common_protos"
OUT_DIR="${ROOT_DIR}/out"
PROTO_SRC_DIR="${ROOT_DIR}/proto-google-common-protos/src"
GRPC_SRC_DIR="${ROOT_DIR}/grpc-google-common-protos/src"

: "${PROTOC_BIN:=$(which protoc)}"
PROTOC_VERSION=$($PROTOC_BIN --version)

if [ "${PROTOC_VERSION}" != "${REQUIRED_PROTOC_VERSION}" ]
then
  echo "Invalid protoc version, expected '${REQUIRED_PROTOC_VERSION}', got '${PROTOC_VERSION}'"
  exit 1
fi

rm -rf ${TEMP_COMMON_PROTOS_DIR}
git clone ${COMMON_PROTOS_REPO} ${TEMP_COMMON_PROTOS_DIR}

# Copy the artman config file to the googleapis dir
cp ${ROOT_DIR}/dev/artman_core.yaml ${TEMP_COMMON_PROTOS_DIR}

rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

# Run artman to generate compiled protos and grpc stubs.
# Artman will handle figuring out which proto src directories to include and exclude
# and invoking the grpc protoc plugin.
# TODO switch to just using protoc.
artman --output-dir ${OUT_DIR} \
  --config google/artman_core.yaml \
  --root-dir ${TEMP_COMMON_PROTOS_DIR} \
  generate java_grpc

rm -rf ${PROTO_SRC_DIR}
mkdir ${PROTO_SRC_DIR}
rm -rf ${GRPC_SRC_DIR}
mkdir ${GRPC_SRC_DIR}

echo "Copy protos to src"
cp -r ${OUT_DIR}/java/proto-google-common-protos/src/* ${PROTO_SRC_DIR}/
cp -r ${OUT_DIR}/java/grpc-google-common-protos/src/* ${GRPC_SRC_DIR}/
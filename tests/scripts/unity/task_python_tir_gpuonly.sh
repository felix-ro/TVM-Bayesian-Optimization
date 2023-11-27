#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -euxo pipefail

export PYTEST_ADDOPTS="-m gpu ${PYTEST_ADDOPTS:-}"

# Test most of the enabled runtimes here.
export TVM_TEST_TARGETS="cuda;opencl;metal;rocm;nvptx;opencl -device=mali,aocl_sw_emu"
export TVM_UNITTEST_TESTSUITE_NAME=python-unittest-gpu

./tests/scripts/unity/task_python_tir.sh
#!/bin/bash

PYTHON=${PYTHON-`which python`}

echo Benchmarking ...

echo -n "    xxh32_intdigest: "
$PYTHON -mtimeit -s 'from xxhash import xxh32_intdigest' \
                 -s 'import os'  \
                 -s 'import random' \
                 -s 'seed = random.randint(0, 0xffffffff)' \
                 -s 'data = os.urandom(1000)' \
                 'xxh32_intdigest(data, seed=seed)'

echo -n "    xxh64_intdigest: "
$PYTHON -mtimeit -s 'from xxhash import xxh64_intdigest' \
                 -s 'import os'  \
                 -s 'import random' \
                 -s 'seed = random.randint(0, 0xffffffffffffffff)' \
                 -s 'data = os.urandom(1000)' \
                 'xxh64_intdigest(data, seed=seed)'

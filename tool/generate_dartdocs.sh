#!/bin/bash

set -e

echo "\n\nBuilding dartdoc API documentation..."
(
    dartdoc &&
    echo "\n\nProducing dartdoc API documentation build artifact..." &&
    tar czvf api.tar.gz -C doc/api .
) || (
    echo "ERROR: dartdoc failed" &&
    touch api.tar.gz
)

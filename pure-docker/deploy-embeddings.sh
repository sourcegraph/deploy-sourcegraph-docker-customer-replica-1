#!/usr/bin/env bash
set -e
source ./replicas.sh

# Description: Backend for embeddings search operations.
#
# Disk: 128GB / non-persistent SSD
# Network: 100mbps
# Liveness probe: HTTP GET http://searcher:3181/healthz
# Ports exposed to other Sourcegraph services: 3181/TCP 6060/TCP
# Ports exposed to the public internet: none
#
docker run --detach \
    --name=embeddings \
    --network=sourcegraph \
    --restart=always \
    --cpus=4 \
    --memory=64g \
    -e GOMAXPROCS=4 \
    -e SRC_FRONTEND_INTERNAL=sourcegraph-frontend-internal:3090 \
    -e 'OTEL_EXPORTER_OTLP_ENDPOINT=http://otel-collector:4317' \
    -e 'SRC_GIT_SERVERS=http://otel-collector:4317' \
    -e SRC_GIT_SERVERS="$(addresses "gitserver-" $NUM_GITSERVER ":3178")" \
    -e 'EMBEDDINGS_UPLOAD_BACKEND=blobstore' \
    -e 'EMBEDDINGS_UPLOAD_AWS_ENDPOINT=http://blobstore:9000' \
    index.docker.io/sourcegraph/embeddings:5.0.5@sha256:09b92c6190aa495646a804847d0ad0dc24e884f40145f14c05230639d9d61cab

echo "Deployed embeddings service"

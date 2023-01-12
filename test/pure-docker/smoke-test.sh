#!/usr/bin/env bash
set -eufxo pipefail

cd /deploy-sourcegraph-docker-customer-replica-1
sudo su

#Deploy sourcegraph
./deploy.sh

expect_containers="59"

echo "Giving containers 10s to start..."
sleep 10

echo "TEST: Number of expected containers created"
containers_count=$(docker ps --format '{{.Names}}' | wc -l)
if [ "$containers_count" -ne "$expect_containers" ]; then
    docker ps --format '{{.Names}}'
    echo
    echo "TEST FAILURE: expected $expect_containers containers, found $containers_count"
    exit 1
fi

echo "TEST: Checking every 10s that containers are running for 5 minutes..."
for i in {0..30}; do
    containers=$(docker ps --format '{{.Names}}' | xargs -I{} -n1 sh -c "printf '{}: ' && docker inspect --format '{{.State.Status}}' {}")
    containers_running=$(echo "$containers" | grep "running" | wc -l)
    if [ "$containers_running" -ne "$expect_containers" ]; then
        docker ps
        echo
        echo "TEST FAILURE: expected $expect_containers containers running, found $containers_running"
        exit 1
    fi
    echo "Containers running OK.. waiting 10s"
    sleep 10
done

echo "TEST: Checking frontend is accessible"
curl -f http://localhost:80
curl -f http://localhost:80/healthz

echo "ALL TESTS PASSED"

# Sourcegraph with Docker (Customer Replica 1)

This is a replica of the pure-docker deployment mode for Sourcegraph. This deployment mode is considered deprecated and should not
be used for new Sourcegraph installations.

[![sourcegraph: search](https://img.shields.io/badge/sourcegraph-search-brightgreen.svg)](https://sourcegraph.com/github.com/sourcegraph/deploy-sourcegraph-docker) [![Build status](https://badge.buildkite.com/e60f9ffcafd68882d3db6fe5e33567e3a111d391a554d50d82.svg)](https://buildkite.com/sourcegraph/deploy-sourcegraph-docker)

This repository is the replica deployment reference of [deploying Sourcegraph with Docker](https://docs.sourcegraph.com/admin/install/docker-compose) for [this](https://github.com/sourcegraph/accounts/issues/565) customer.

> 🚨 IMPORTANT: When upgrading Sourcegraph, please check [upgrading docs](https://docs.sourcegraph.com/admin/updates/docker_compose) to check if any manual migrations are necessary.
>
> The `main` branch tracks development. Use the branch of this repository corresponding to the
> version of Sourcegraph you wish to deploy, e.g. `git checkout 3.19`.

For product and [pricing](https://about.sourcegraph.com/pricing/) information, visit
[about.sourcegraph.com](https://about.sourcegraph.com) or [contact
us](https://about.sourcegraph.com/contact/sales) for more information. If you're just starting out,
we recommend running Sourcegraph as a [single Docker
container](https://docs.sourcegraph.com/#quickstart-guide) or using [Docker
Compose](https://docs.sourcegraph.com/admin/install/docker-compose). Migrating to Sourcegraph on
Kubernetes is easy later.

## Is the Docker (Customer Replica 1) deployment type for me?

No. Please see our [docs](https://docs.sourcegraph.com/admin/deploy) for a variety of installation methods that will suit your needs, or [learn more about Sourcegraph Cloud](https://about.sourcegraph.com/).
Hello World

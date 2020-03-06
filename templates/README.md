# Project Title

Short project description

## Environments

| Branch  | Domain                                | Deployment | CI                                      |
| ------- | ------------------------------------- | ---------- | --------------------------------------- |
| develop | https://`[project-name]`-develop.renuoapp.ch | auto       | [![Build Status][ci-develop-badge]][ci] |
| testing | https://`[project-name]`-testing.renuoapp.ch | auto       | [![Build Status][ci-testing-badge]][ci] |
| master  | https://`[project-name]`-master.renuoapp.ch  | release    | [![Build Status][ci-master-badge]][ci]  |

[ci]: https://renuo.semaphoreci.com/projects/`[project-name]`
[ci-develop-badge]: FETCH FROM SEMAPHORECI
[ci-testing-badge]: FETCH FROM SEMAPHORECI
[ci-master-badge]: FETCH FROM SEMAPHORECI

## Setup

```sh
git clone git@github.com:renuo/[project-name].git
cd [project-name]
bin/setup
```

### Configuration

Configure the following:

* config/application.yml

### Run

```sh
bin/run
```

### Dependency

Dependencies list

### Tests / Checks

```sh
bin/check
```

## Other

special stuff

## Copyright

Copyright 2020 [Renuo AG](https://www.renuo.ch/).

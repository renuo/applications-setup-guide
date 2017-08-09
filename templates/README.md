# Project Title
Short project description

## Environments

| Branch  | Domain                                | Deployment | CI                                      |
| ------- | ------------------------------------- | ---------- | --------------------------------------- |
| develop | https://`[project-name]`-develop.renuoapp.ch | auto       | [![Build Status][ci-develop-badge]][ci] |
| testing | https://`[project-name]`-testing.renuoapp.ch | auto       | [![Build Status][ci-testing-badge]][ci] |
| master  | https://`[project-name]`-master.renuoapp.ch  | release    | [![Build Status][ci-master-badge]][ci]  |

[ci]: https://semaphoreci.com/renuo/`[project-name`]
[ci-develop-badge]: https://semaphoreci.com/renuo/`[project-name]`.svg?token=ADD_TRAVIS_TOKEN&branch=develop
[ci-testing-badge]: https://semaphoreci.com/renuo/`[project-name]`.svg?token=ADD_TRAVIS_TOKEN&branch=testing
[ci-master-badge]: https://semaphoreci.com/renuo/`[project-name]`.svg?token=ADD_TRAVIS_TOKEN&branch=master

[![Dependency Status](https://gemnasium.com/ADD_GEMNASIUM_TOKEN.svg)](https://gemnasium.com/renuo/`[project-name]`)

## Setup

```sh
git clone git@github.com:renuo/[project-name].git
cd [project-name]
bin/setup
```

### Configuration

* config/application.yml
* config/database.yml


### Dependency
Dependencies

### Tests / Checks

```sh
bin/check
```

## Other
special stuff

## Copyright

Coypright 2017 [Renuo AG](https://www.renuo.ch/).


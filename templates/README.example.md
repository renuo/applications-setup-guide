# Project Title
Short project description

## Environments

| Branch  | Domain                                | Deployment | CI                                      |
| ------- | ------------------------------------- | ---------- | --------------------------------------- |
| develop | https://<appname>-develop.renuoapp.ch | auto       | [![Build Status][ci-develop-badge]][ci] |
| testing | https://<appname>-testing.renuoapp.ch | auto       | [![Build Status][ci-testing-badge]][ci] |
| master  | https://<appname>-master.renuoapp.ch  | release    | [![Build Status][ci-master-badge]][ci]  |

[ci]: https://travis-ci.com/renuo/<appname>
[ci-develop-badge]: https://travis-ci.com/renuo/<appname>.svg?token=ADD_TRAVIS_TOKEN&branch=develop
[ci-testing-badge]: https://travis-ci.com/renuo/<appname>.svg?token=ADD_TRAVIS_TOKEN&branch=testing
[ci-master-badge]: https://travis-ci.com/renuo/<appname>.svg?token=ADD_TRAVIS_TOKEN&branch=master

[![Dependency Status](https://gemnasium.com/ADD_GEMNASIUM_TOKEN.svg)](https://gemnasium.com/renuo/<appname>)

## Setup

```sh
git clone git@github.com:renuo/<appname>.git
cd <appname>
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

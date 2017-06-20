# Project Title
Short project description

## Environments

| Branch  | Domain                          | Deployment | CI                                      |
| ------- | ------------------------------- | ---------- | --------------------------------------- |
| develop | https://                        | auto       | [![Build Status][ci-develop-badge]][ci] |
| testing | https://                        | auto       | [![Build Status][ci-testing-badge]][ci] |
| master  | https://                        | release    | [![Build Status][ci-master-badge]][ci]  |

[ci]: https://travis-ci.com/renuo/<appname>
[ci-develop-badge]: https://travis-ci.com/renuo/<url>
[ci-testing-badge]: https://travis-ci.com/renuo/<url>
[ci-master-badge]: https://travis-ci.com/renuo/<url>

[![Dependency Status](https://gemnasium.com/ADD_GEMNASIUM_TOKEN.svg)](https://gemnasium.com/renuo/<appname>)

## Setup

```
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


[![Dependency Status](https://gemnasium.com/TODO.svg)](https://gemnasium.com/renuo/<appname>) [![Build Status](https://travis-ci.com/renuo/<appname>.svg?token=TODO&branch=master)](https://travis-ci.com/renuo/<appname>) [![Build Status](https://travis-ci.com/renuo/<appname>.svg?token=TODO&branch=develop)](https://travis-ci.com/renuo/<appname>) [![Build Status](https://travis-ci.com/renuo/<appname>.svg?token=TODO&branch=testing)](https://travis-ci.com/renuo/<appname>)

# <appname>

## Important Links

* TODO: link to issue tracker, wiki, important resources, etc.
* https://github.com/renuo/<appname>
* https://<appname>-master.renuoapp.ch
* https://<appname>-develop.renuoapp.ch
* https://<appname>-testing.renuoapp.ch

## Installation

```sh
git clone git@github.com:renuo/<appname>.git
cd <appname>
bin/setup
```

### Configuration

```sh
bin/setup
```

* config/application.yml

## Tests / Code Linting / Vulnerability Check

### Everything

```sh
bin/check
```

This runs

* keyword check (console.log, TODO, puts, ...)
* rubocop
* scsslint
* tslint
* coffeelint
* brakeman
* rspec

### Rspec Only

```sh
rspec
```

## Run

```sh
bin/run
```

## Copyright

Coypright 2016 [Renuo GmbH](https://www.renuo.ch/).

# Run Javascript tests with Jest

When you start writing Javascript code, you have to test it. Webpacker doesn't come (yet) with a default test tool.
Here is a configuration suggestion to start testing using Jest.

* Install Jest
```bash
./bin/yarn add --dev jest
```

* Add the following to the `package.json`

```json
  "scripts": {
    "test": "jest --coverage"
  },
  "jest": {
    "roots": [
      "spec/javascripts"
    ],
    "setupFiles": [
      "./spec/javascripts/setup-jest.js"
    ],
    "coverageThreshold": {
      "global": {
        "branches": 100.0,
        "functions": 100.0,
        "lines": 100.0,
        "statements": 100.0
      }
    },
    "coverageDirectory": "./coverage/jest"
  }
```
This creates a `yarn test` command which runs your tests, including coverage.
It also configures the root of your tests into spec/javascripts folder and the coverage thresholds.

* Create the file `spec/javascripts/setup-jest.js` and, if you are using JQuery, add:

```js
import $ from 'jquery';
global.$ = global.jQuery = $;
```
In this file you create the configuration that is necessary before running the tests.

* Add the following to your `.babelrc` configuration file:

```
"env": {
  "test": {
    "plugins": ["transform-es2015-modules-commonjs"]
  }
}
```

Now you can run your tests with `yarn test` and they should fail because you don't have any test.

Add your Javascript tests check run to `bin/check`:

```
bin/yarn test
if [ $? -ne 0 ]; then
  echo 'Javascript tests did not run successfully, commit aborted'
  exit 1
fi
```

Add your tests to the `spec/javascripts` folder,
naming them `yourtest.spec.js` to be automatically recognised by Jest as tests.

A template for a test could be the following:

```js
// spec/javascripts/my_class.spec.js

import MyClass from '../../app/webpacker/src/javascripts/my_class';

describe('MyClass', () => {

  beforeEach(() => {
    ...
  });

  describe('#amethod', () => {
    it('runs a test', () => {
      new MyClass();
      expect(1).toEqual(2);
    });
  });
});

```

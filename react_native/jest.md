# Jest

Create a `jest.config.js` file in the project root with the following contents:

Install some test libraries:

```
yarn add enzyme-adapter-react-16 enzyme enzyme-to-json
yarn add -D @types/enzyme @types/enzyme-adapter-react-16 jest-fetch-mock
```

```javascript
const { defaults: tsjPreset } = require('ts-jest/presets');

module.exports = {
  ...tsjPreset,
  preset: 'react-native',
  testEnvironment: 'jsdom',
  transform: {
    ...tsjPreset.transform,
    '\\.js$': '<rootDir>/node_modules/react-native/jest/preprocessor.js',
  },
  globals: {
    'ts-jest': {
      diagnostics: true,
      babelConfig: true,
    }
  },
  testPathIgnorePatterns: [
    "<rootDir>/e2e/",
    "<rootDir>/node_modules/"
  ],
  snapshotSerializers: ["enzyme-to-json/serializer"],
  testRegex: "(/__tests__/.*|(\\.|/)(test|spec))\\.(jsx?|tsx?)$",
  moduleFileExtensions: [
    "ts",
    "tsx",
    "js",
    "jsx",
    "json",
    "node"
  ],
  resetMocks: true,
  coverageReporters: [
    "json",
    "lcov",
    "text-summary"
  ],
  transformIgnorePatterns: [
    "!node_modules"
  ],
  modulePaths: [
    "<rootDir>"
  ],
  setupFiles: [
    "./tests/setup.tsx"
  ],
  collectCoverage: true,
  cacheDirectory: ".jest/cache",
  coveragePathIgnorePatterns: [
    "<rootDir>/node_modules/",
    "<rootDir>/locales/",
    "<rootDir>/e2e",
    "<rootDir>/tests",
    "(.*)/index.ts"
  ],
  coverageThreshold: {
    global: {
      branches: 100,
      functions: 100,
      lines: 100,
      statements: 100
    }
  },
  reporters: ["default", "jest-junit"],
};
```

Under `tests/setup.tsx` create the following file:

```javascript
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import jestFetchMock from 'jest-fetch-mock';
(global as any).fetch = jestFetchMock;

configure({ adapter: new Adapter() });
```

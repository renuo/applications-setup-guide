# Typings / TS-Lint
All typings-files are checked in. Make sure you don't have the `typings` in the `.gitignore`.

typings.json:
```json
{
  "name": "<<appname>>", // enter here your appname
  "globalDependencies": {
    // here your dependencies are automatically created e.g.
    // "jquery": github:DefinitelyTyped/DefinitelyTyped/jquery/jquery.d.ts#056a2c38f5822903eadf7cc4acf566765681229b"
  }
}
```

Each `.ts` file includes the reference-path like that:
`///<reference path="../../../typings/globals/{{any-application}}/index.d.ts"/>`


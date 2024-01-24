# fastlane

We manage our iOS app certificates with [fastlane](https://fastlane.tools/).
They are managed in this private repository: [fastlane-ios-certificates](https://github.com/renuo/fastlane-ios-certificates).

## Renewing Apple iOS certificates with fastlane

Once a year the certificates will expire, so we have to create new ones.
We do it like that in each of our projects:

```sh
# Replace development certs
bundle exec fastlane match nuke development
bundle exec fastlane match development

# Replace distribution certs
bundle exec fastlane match nuke distribution --safe_remove_certs
bundle exec fastlane match appstore
```

# React Native

## Release

### iOS

* log in here and create the bundle identifier: <https://developer.apple.com/account/resources/identifiers/list>
* make sure to select push notifications in the capabilities if it's needed
* log in there with operations@renuo.ch account
* then as a second step, you need to create the app listing in <https://appstoreconnect.apple.com/WebObjects/iTunesConnect.woa/ra/ng/app>
* (wait a couple of minutes until the new app identifier is synchronized to all lists)
* click the plus button and select new app
* when you have this, you should be already able to publish the app. 
  I’d configure fastlane for that (copy&paste the config from another app (e.g.: <https://github.com/renuo/citymessenger/tree/develop/app/fastlane>),
  change the identifier and run `bundle exec fastlane match development && bundle exec fastlane match appstore`).
  This will create the certificates an push them to the repo here <https://github.com/renuo/fastlane-ios-certificates>

### Android

Prepare your repo like in this commit: <https://github.com/renuo/citymessenger/pull/182/commits/5b7bdc7d2137ffd885ed8fa8f56be1aa3ee550e2>

Prepare three new passwords and add them to *1password*:

* App encrypted secrets password
* Android keystore password
* Android keystore key0

Create a file `keystore.properties` and save the two passwords "Android keystore password" and "Android keystore key0"
there in the following form:

    APP_RELEASE_STORE_PASSWORD=<Android keystore password>
    APP_RELEASE_KEY_PASSWORD=<Android keystore key0>

Encrypt this file with the "App encrypted secrets password" to be checked into the git repo:

    openssl enc -aes-256-cbc -salt -a -in android/keystore.properties -out android/keystore.properties.enc

Create a signing key using "Android keystore password" and "Android keystore key0" with the key tool:

    keytool -genkey -v -keystore app.jks -alias key0 -keyalg RSA -keysize 2048 -validity 10000

You need to log in to <https://play.google.com/apps/publish/> with the google@renuo.ch account) and create the app there.
You will need much more information for the store listing than for ioOS, they require also the screenshots,
etc., otherwise it’s not possible to even make the internal testing build.

Add a service account to Google and generate a `key.json` file (no other configurations), download it
and encrypt it with the "App encrypted secrets password".

    openssl enc -aes-256-cbc -salt -a -in android/key.json -out android/key.json.enc

Add the service account to the app users with the role release manager.

When it’s there, it should also just work with `bundle exec fastlane android deploy`

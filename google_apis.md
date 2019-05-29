# Google APIs

* If you need Google APIs in your project (e. g. Google Maps or Google+) proceed to the [Google Cloud Console](https://console.cloud.google.com).

* Create a project named `[project-name]` under the renuo.ch organisation
and use that project for all your environments.

![google_app_1](images/google_app_1.png)

* After creating it, make sure that it is selected in the header and enable the Google APIs that you need for this project under `APIs & Services > Library`

* When asked, attach the `wg-education CC` as billing account.

## API key generation

**Maps JavaScript API**

In order to user the Google APIs you will need to generate new credentials. Because we are using only one project per application, but would like to separate the usage in development from the one in production, name the keys like so: `MASTER Maps Public Key` and `DEVELOP Maps Public Key`.

**Geocoding API**

As for the JS API, create two different keys for the two environments, but this time replacing `Public` with `Private`. This is because the Geocoding API key won't be exposed in the frontend.

## API key restrictions

**Maps JavaScript API**

To prevent quota and key theft, we need to add some restrictions to our keys. There are two types of restrictions: Key restrictions and API restrictions. For the develop API key add the following ones:

![google_app_2](images/google_app_2.png)

For master, enable only the specific domain **and** both the renuoapp.ch and herokuapp.com domains.

**Geocoding API**

Because the Geocoding API key doesn't support HTTP referrer restrictions (which isn't a problem anyway since the key won't be exposed), you only need to add an API restriction, restricting the key to the Geocoding API.

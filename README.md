# Air Quality

An app that displays the current air quality of a given location.

## Technology
Built using Dart and Flutter.

## Data

The data is taken from the API provided by the [World Air Quality Index project](https://aqicn.org/).

## External Libraries used
* [http](https://pub.dev/packages/http)

## Setup

To get the external libraries used:
````bash
$ flutter pub get
````

API Key:
You will need to provide your own api key, available for free here: [https://aqicn.org/data-platform/register/](https://aqicn.org/data-platform/register/)

To include the API key in the app, create an api folder in the assets directory
````bash
$ cd assets
$ cd mkdir api
````
Next, create an apikey.json file in that directory
````bash
$ cd assets/api
$ touch apikey.json
````
Add the following to the apikey.json file...
````json
{
  "apikey": "YOUR_API_KEY_GOES_HERE"
}
````
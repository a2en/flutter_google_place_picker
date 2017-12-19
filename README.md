# flutter_google_place_picker

Google place picker for flutter.


## Getting Started

For help getting started with Flutter, view our online [documentation](http://flutter.io/).

```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  flutter_google_place_picker: <last-version>
```

```dart

const kGoogleApiKey = "API_KEY";

Prediction p = await showGooglePlacesAutocomplete(
                          context: context,
                          apiKey: kGoogleApiKey,
                          mode: Mode.overlay, // Mode.fullscreen
                          language: "fr",
                          components: [new Component(Component.country, "fr")]);

```
For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).

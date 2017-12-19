# flutter_google_place_picker

Google place picker for flutter.

##currently this plugin only support android

## Getting Started

Add dependancy:
```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  flutter_google_place_picker: <last-version>
```
asynchronously call launchPlacePicker which returns a hashmap containing place details:
```dart 
PickPlace() async {
    Map place;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      place = await FlutterGooglePlacePicker.launchPlacePicker;
    } on PlatformException {
      
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted)
      return;

    setState(() {
      /*get values inside the map 
      place["name"];......
      */
     _place =  place.toString();
    });
  }


```

For Android:

Edit AndroidManifest.xml and add api key

```xml
<application>
<meta-data
            android:name="com.google.android.geo.API_KEY"
            android:value="AIzaSyDJABBjxhd4EnrJTml5ImCcZN2hLVKC0t0"/>
</application>

```

For IOS:

Need help with ios

For help getting started with Flutter, view our online [documentation](http://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).

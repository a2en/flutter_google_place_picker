import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_place_picker/flutter_google_place_picker.dart';



void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _place = 'Result Appears here';

  @override
  initState() {
    super.initState();
    
  }

  
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
      place["latitude"];
      */
     _place =  place.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Container(
           margin: new EdgeInsets.only(top:200.0),
          child: new Center(
             child:  new Column(
             children: <Widget>[
              new FlatButton(
                   color: Colors.lightBlueAccent,
                  child: new Text('Pick Place'),
                  onPressed: (){
                      PickPlace();
                  },
              ),
              new Text('Place:Map : $_place\n'),
             ],
          )
          )
        ),
      ),
    );
  }
}


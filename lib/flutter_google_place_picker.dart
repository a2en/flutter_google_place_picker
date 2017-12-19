import 'dart:async';

import 'package:flutter/services.dart';

class FlutterGooglePlacePicker {
  static const MethodChannel _channel =
      const MethodChannel('flutter_google_place_picker');
      
  static Future<Map> get launchPlacePicker =>
      _channel.invokeMethod('launchplacepicker');
}

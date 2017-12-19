import Flutter
import UIKit
import GooglePlaces
    
public class SwiftFlutterGooglePlacePickerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_google_place_picker", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterGooglePlacePickerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let config = GMSPlacePickerConfig(viewport: nil)
    let placePicker = GMSPlacePickerViewController(config: config)

    present(placePicker, animated: true, completion: nil)
    result("iOS " + UIDevice.current.systemVersion)
  }

  func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
  // Dismiss the place picker, as it cannot dismiss itself.
   viewController.dismiss(animated: true, completion: nil)

   print("Place name \(place.name)")
   print("Place address \(place.formattedAddress)")
   print("Place attributions \(place.attributions)")
  }

  func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
  // Dismiss the place picker, as it cannot dismiss itself.
   viewController.dismiss(animated: true, completion: nil)

   print("No place selected")
  }
}

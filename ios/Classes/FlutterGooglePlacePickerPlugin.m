#import "FlutterGooglePlacePickerPlugin.h"
#import <flutter_google_place_picker/flutter_google_place_picker-Swift.h>

@implementation FlutterGooglePlacePickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterGooglePlacePickerPlugin registerWithRegistrar:registrar];
}
@end

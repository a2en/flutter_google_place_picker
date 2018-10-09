package me.a2en.fluttergoogleplacepicker;

import android.app.Activity;
import android.content.Intent;
import 	java.util.HashMap;

import io.flutter.app.FlutterPluginRegistry;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener;

import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.location.places.GeoDataClient;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.Places;
import com.google.android.gms.location.places.PlaceDetectionClient;
import com.google.android.gms.location.places.ui.PlacePicker;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;

import static android.app.Activity.RESULT_OK;


public class FlutterGooglePlacePickerPlugin implements MethodCallHandler  {

  private static Registrar instance;
  protected GeoDataClient mGeoDataClient;
  private static int PLACE_PICKER_REQUEST = 1;
  protected PlaceDetectionClient mPlaceDetectionClient;
  private LatLng latLng;
  private LatLngBounds latLngBounds;
  private static Result pendingResult;
  /**
   * Plugin registration.
   */
  public static void registerWith(final Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_google_place_picker");
    channel.setMethodCallHandler(new FlutterGooglePlacePickerPlugin());

    instance = registrar;
    instance.addActivityResultListener(new PluginRegistry.ActivityResultListener(){

      @Override
      public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == PLACE_PICKER_REQUEST) {
          if (resultCode == RESULT_OK) {
            Place place = PlacePicker.getPlace(registrar.activity(), data);
            HashMap<String, String> mPlace = new HashMap<>();
            mPlace.put("latitude", place.getLatLng().latitude + "");
            mPlace.put("longitude", place.getLatLng().longitude + "");
            mPlace.put("id", place.getId());
            mPlace.put("name", place.getName().toString());
            mPlace.put("address", place.getAddress().toString());
            pendingResult.success(mPlace);
            return true;
          }
        }
        return false;
      }
    });

  }


  @Override
  public void onMethodCall(MethodCall call, final Result result) {
    if (call.method.equals("launchplacepicker")) {
      pendingResult=result;
      PlacePicker.IntentBuilder builder = new PlacePicker.IntentBuilder();
     /* set latlngbounds needs to be implimented
     builder.setLatLngBounds(latLngBounds);
      */
      try {
        instance.activity().startActivityForResult(builder.build(instance.activity()), PLACE_PICKER_REQUEST);
      } catch (GooglePlayServicesRepairableException e) {
        e.printStackTrace();
        result.error("Exception", e.toString(), null);
      } catch (GooglePlayServicesNotAvailableException e) {
        e.printStackTrace();
        result.error("Exception", e.toString(), null);
      }

    }else {
      result.notImplemented();
    }
  }
}


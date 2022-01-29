import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/Location.dart';

class LocationService {
  Future<Location> getCurrentLocation() async {
    final bool permissionStatus = await _checkPermission();
    if (permissionStatus) {
      try {
        final Position position =
            await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        String currentAddress = await getAddressFromLatLng(
            latitude: position.latitude, longitude: position.longitude);
        final Location currentLocation = Location(
            latitude: position.latitude,
            longitude: position.longitude,
            address: currentAddress);
        return currentLocation;
      } on Exception catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String> getAddressFromLatLng(
      {double latitude, double longitude}) async {
    try {
      final coordinates = new Coordinates(latitude, longitude);
      final List<Address> addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      Address address = addresses[0];
      String area = address.subAdminArea != null
          ? "${address.subAdminArea}, "
          : address.adminArea != null ? "${address.adminArea}, " : "";
      String country =
          address.countryName != null ? "${address.countryName}" : "";
      return "${area}${country}";
    } catch (e) {}
  }

  Future<bool> _checkPermission() async {
    final status = await Permission.location.status;
    if (status != PermissionStatus.granted) {
      final result = await Permission.location.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }
}

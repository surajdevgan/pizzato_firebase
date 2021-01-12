import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as GeoCo;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String finalAddress = 'Searching Address...';

class GenerateMaps extends ChangeNotifier {
  Position position;
  Position get getPosition => position;

  String get getFinalAddress => finalAddress;
  GoogleMapController googleMapController;
  Future getCurrentLocation() async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final cords =
        GeoCo.Coordinates(positionData.latitude, positionData.longitude);

    var address =
        await GeoCo.Geocoder.local.findAddressesFromCoordinates(cords);

    String mainAddress = address.first.addressLine;
    finalAddress = mainAddress;
    notifyListeners();
  }
}
c
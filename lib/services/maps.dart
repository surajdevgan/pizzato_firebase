import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as GeoCo;
import 'package:geolocator/geolocator.dart';

String finalAddress = 'Searching Address...';

class GenerateMaps extends ChangeNotifier {
  Position position;

  Future getCurrentLocation() async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final cords =
        GeoCo.Coordinates(positionData.latitude, positionData.longitude);

    var address =
        await GeoCo.Geocoder.local.findAddressesFromCoordinates(cords);

    String mainAddress = address.first.addressLine;
    print(mainAddress);
    finalAddress = mainAddress;
    notifyListeners();
  }
}

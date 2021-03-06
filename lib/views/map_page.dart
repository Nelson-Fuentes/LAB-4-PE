import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final double lattitude, longitude;
  final String name, lastname;
  const MapPage(
      {Key? key,
      required this.lattitude,
      required this.longitude,
      required this.name,
      required this.lastname})
      : super(key: key);

  _MapPageState createState() =>
      _MapPageState(lattitude, longitude, name, lastname);
}

class _MapPageState extends State<MapPage> {
  _MapPageState(
      double lattitude, double longitude, String name, String lastname) {
    ubicacion = LatLng(lattitude, longitude);
    title = "Ubicacion de " + name;
    description = name + " " + lastname;
  }

  String? title, description;
  LatLng? ubicacion;

  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  Widget build(BuildContext context) {
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(
      markerId: markerId,
      position: ubicacion!,
      infoWindow: InfoWindow(title: title, snippet: description),
    );
    _markers[markerId] = marker;
    return Scaffold(
        appBar: AppBar(
          title: Text("Mapa de " + widget.name),
        ),
        body: GoogleMap(
          markers: markers,
          initialCameraPosition: CameraPosition(target: ubicacion!, zoom: 16),
          myLocationButtonEnabled: false,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
        ));
  }
}
//widget.longitude.toString()
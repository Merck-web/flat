import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SportTheBird extends StatefulWidget {
  const SportTheBird({super.key});

  @override
  State<SportTheBird> createState() => _SportTheBirdState();
}

class _SportTheBirdState extends State<SportTheBird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(57.910117, 59.993586),
          initialZoom: 15.0,
          maxZoom: 20,
          minZoom: 3,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}

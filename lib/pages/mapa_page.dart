import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scanner/theme/app_theme.dart';

class MapaPage extends StatefulWidget {
   
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final dynamic args = ModalRoute.of(context)!.settings.arguments;
    final ScanModel scan = args as ScanModel;

  final CameraPosition puntoInicial = CameraPosition(
    target: scan.getLatLng(),
    zoom: 18,
    tilt: 60
  );

  //MARCADORES

  Set<Marker> markers = <Marker>{};
  markers.add(Marker(
    markerId: const MarkerId('geo-location'),
    position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
           onPressed: () async {
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: scan.getLatLng(),
                  zoom: 18,
                  tilt: 60
                )
              )
            );
           },
           icon: Icon(Icons.location_disabled))
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.darkTheme.primaryColor, // Reemplaza AppTheme.darkTheme.primaryColor con el color deseado
          onPressed: () {
            if (mapType == MapType.normal) {
              mapType = MapType.satellite;
            } else {
              mapType = MapType.normal;
            }
            setState(() {});
          },
          child: const Icon(
            Icons.layers,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // Cambia la posición según tus necesidades
      );
  }
}
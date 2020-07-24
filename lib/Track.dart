import 'dart:async';

import 'package:bus_tracker/AppStateNotifier.dart';
import 'package:bus_tracker/TheDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Track extends StatefulWidget {
  static const String routeName = '/track';

  @override
  State<Track> createState() => TrackState();
}

class TrackState extends State<Track> {
  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(8.4818412, 76.9413771),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
//    bearing: 192.8334901395799,
    target: LatLng(8.4818412, 76.9413771),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );
  List<Marker> myMarker = [];
  @override
  Widget build(BuildContext context) {
    var isDark =
        Provider.of<AppStateNotifier>(context, listen: false).isDarkMode;
    return new Scaffold(
      key: _scaffoldKey,
      drawer: TheDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text(
          'Bus Tracker',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set.from(myMarker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: _handleTap,
      ),
      floatingActionButton: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                heroTag: "directions",
                onPressed: () {
                  _getCurrentLocation();
                  _goToTheLake();
                },
                child: Icon(Icons.directions),
                backgroundColor: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                heroTag: "location",
                onPressed: () {
                  _getCurrentLocation();
                  _goToTheLake();
                },
                child: Icon(Icons.gps_fixed),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void _handleTap(LatLng tappedPoint) {
    print(tappedPoint);
    myMarker = [];
    myMarker.add(
      Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          draggable: true,
          onDragEnd: (draggedEndPoint) {
            print(draggedEndPoint);
          }),
    );
    setState(() {});
  }
}

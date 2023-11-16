import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kafaat/core/core_exports.dart';

class ActiveMapWidget extends StatefulWidget {
  const ActiveMapWidget({
    super.key,
    this.width,
    this.height,
    this.long,
    this.lat,
    this.zoom,
    this.onTap,
    this.onCameraMove,
  });
  final double? width;
  final double? height;
  final double? long;
  final double? lat;
  final double? zoom;
  final void Function(LatLng newPosition)? onTap;
  final void Function(CameraPosition cameraPosition)? onCameraMove;

  @override
  State<ActiveMapWidget> createState() => _ActiveMapWidgetState();
}

class _ActiveMapWidgetState extends State<ActiveMapWidget> {
  static late LatLng position;
  BitmapDescriptor positionIcon = BitmapDescriptor.defaultMarker;

  late GoogleMapController controller;
  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, getAsset('pin'))
        .then((value) {
      setState(() {
        positionIcon = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    position = LatLng(widget.lat!, widget.long!);

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: position,
          zoom: widget.zoom ?? 14.5,
        ),
        onMapCreated: (GoogleMapController mcontroller) {
          controller = mcontroller;
          controller
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: position,
            zoom: widget.zoom ?? 14.5,
          )));
        },
        markers: {
          Marker(
              icon: positionIcon,
              markerId: const MarkerId('position'),
              position: position),
        },
        onCameraMove: widget.onCameraMove,
        onTap: widget.onTap,
        gestureRecognizers: {}
          ..add(Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer()))
          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
          ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
          ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
          ..add(Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer())),
      ),
    );
  }
}

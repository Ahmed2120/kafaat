import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kafaat/core/core_exports.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    this.width,
    this.height,
    this.long,
    this.lat,
    this.zoom,
  });
  final double? width;
  final double? height;
  final double? long;
  final double? lat;
  final double? zoom;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  static late LatLng position;

  late CameraPosition initialCameraPosition;
  BitmapDescriptor positionIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, getAsset('pin'))
        .then((value) {
      setState(() {
        positionIcon = value;
      });
    });
    position = LatLng(widget.lat ?? 30.47362, widget.long ?? 31.0354367);
    initialCameraPosition = CameraPosition(
      target: position,
      zoom: widget.zoom ?? 14.5,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.terrain,
        initialCameraPosition: initialCameraPosition,
        markers: {
          Marker(
              icon: positionIcon,
              markerId: const MarkerId('position'),
              position: position),
        },
      ),
    );
  }
}

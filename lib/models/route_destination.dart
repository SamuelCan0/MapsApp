import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class RouteDestination {
  final List<LatLng> point;
  final double duration;
  final double distance;

  RouteDestination({
    required this.point,
    required this.distance,
    required this.duration,
  });
}

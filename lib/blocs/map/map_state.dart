part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowUser;
  final Map<String, Polyline> polyline;
  final bool showMyRoute;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowUser = true,
    this.showMyRoute = true,
    Map<String, Polyline>? polyline,
  }) : polyline = polyline ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowUser,
    Map<String, Polyline>? polyline,
    bool? showMyRoute,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowUser: isFollowUser ?? this.isFollowUser,
        polyline: polyline ?? this.polyline,
        showMyRoute: showMyRoute ?? this.showMyRoute,
      );

  @override
  List<Object> get props =>
      [isMapInitialized, isFollowUser, polyline, showMyRoute];
}

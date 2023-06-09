import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:maps_app/models/models.dart';
import 'package:maps_app/services/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TrafficServices trafficServices;

  SearchBloc({
    required this.trafficServices,
  }) : super(const SearchState()) {
    on<OnActivateManualMarkerEvent>((event, emit) => emit(
          state.copyWith(displayManualMarker: true),
        ));

    on<OnDiactivateManualMarkerEvent>((event, emit) => emit(
          state.copyWith(displayManualMarker: false),
        ));

    on<OnNewPlacesFoundEvent>((event, emit) => emit(
          state.copyWith(places: event.places),
        ));
    on<AddToHistoryEvent>((event, emit) => emit(
          state.copyWith(history: [event.place, ...state.history]),
        ));
  }

  Future<RouteDestination> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final trafficResponse =
        await trafficServices.getCoorsStartToEnd(start, end);

    final distance = trafficResponse.routes[0].distance;
    final duration = trafficResponse.routes[0].duration;
    final geometry = trafficResponse.routes[0].geometry;

    //decodificar
    final points = decodePolyline(geometry, accuracyExponent: 6);

    final latLngList = points
        .map((coor) => LatLng(coor[0].toDouble(), coor[1].toDouble()))
        .toList();

    return RouteDestination(
      point: latLngList,
      distance: distance,
      duration: duration,
    );
  }

  Future getPlacesByQuery(LatLng proximity, String query) async {
    final newPlaces = await trafficServices.getResultsByQuery(proximity, query);
    add(OnNewPlacesFoundEvent(newPlaces));
  }
}

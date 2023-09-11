import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../bloc/map_bloc/mapa_bloc.dart';

class MapaView extends StatelessWidget {
  final Set<Marker> markers;
  final LatLng initialLocation;
  const MapaView(
      {Key? key, required this.initialLocation, required this.markers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapaBloc>(context);

    final CameraPosition initialCameraPosition =
        CameraPosition(target: initialLocation, zoom: 15);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        compassEnabled: false,
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,

        onMapCreated: (controller) =>
            mapBloc.add(OnMapInitialzedEvent(controller)),
        markers: markers,

        // TODO: Markers
        // TODO: polylines
        // TODO: Cuando se mueve el mapa
      ),
    );
  }
}

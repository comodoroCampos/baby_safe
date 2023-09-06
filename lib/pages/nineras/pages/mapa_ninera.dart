import 'package:baby_safe/models/ninera.dart';
import 'package:baby_safe/services/ninera_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../bloc/location_bloc/location_bloc.dart';
import '../../../bloc/nineras/nineras_bloc.dart';
import '../widgets/map_view.dart';

class MapaNineraPage extends StatefulWidget {
  const MapaNineraPage({super.key});

  @override
  State<MapaNineraPage> createState() => _MapaNineraPageState();
}

class _MapaNineraPageState extends State<MapaNineraPage> {
  final nineraService = NineraService();
  Set<Marker> markers = <Marker>{};
  late LocacionBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocacionBloc>(context);
    locationBloc.startFollowingUser();
    locationBloc.getCurrentPosition();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<LocacionBloc, LocacionState>(
        builder: (context, state) {
          if (state.locacion.lastKnownLocation == null) {
            return const Center(child: Text('Espere por favor...'));
          }
          if (kDebugMode) {
            print(state.locacion.lastKnownLocation);
          }
          return BlocBuilder<NinerasBloc, NinerasState>(
            builder: (context, stateNInera) {
              _marcadores(stateNInera.nineras ?? []);
              return Stack(
                children: [
                  MapaView(
                    initialLocation: state.locacion.lastKnownLocation!,
                    markers: markers,
                  )
                ],
              );
            },
          );
        },
      ),
    ));
  }

  _marcadores(List<Ninera>? nineras) async {
    for (Ninera ptn in nineras ?? []) {
      markers.add(Marker(
          markerId: MarkerId('${ptn.id}${ptn.nombre}'),
          position: LatLng(ptn.latitud!, ptn.longitud!),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onTap: () {},
          infoWindow: InfoWindow(
            title: ' ${ptn.nombre} ',
            snippet: ' ${ptn.valorHora} ',
          )));
    }
  }
}

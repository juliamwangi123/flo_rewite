// ignore_for_file: depend_on_referenced_packages
import 'package:floo_aid_rewrite/features/collection_points/presentation/bloc/drop_off_points_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class DropOffPointsMap extends StatelessWidget {
  const DropOffPointsMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Builder(
        builder: (context) {
          context.read<DropOffPointsBloc>().add(
            const FetchDropOffPointsEvent(),
          );
          return BlocConsumer<DropOffPointsBloc, DropOffPointsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              List<Marker> markers = [];
              if (state.dropOffPoints != null) {
                for (var point in state.dropOffPoints!) {
                  markers.add(
                    Marker(
                      point: LatLng(
                        point.coordinates.latitude,
                        point.coordinates.longitude,
                      ),
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 25.0,
                      ),
                    ),
                  );
                }
              }

              return FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(-1.286389, 36.817223), // Nairobi
                  initialZoom: 12.0,
                ),
                children: [
                  TileLayer(
                   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.flooaid.app',
                  ),
                  MarkerLayer(markers: markers),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap:
                            () => launchUrl(
                              Uri.parse('https://openstreetmap.org/copyright'),
                            ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

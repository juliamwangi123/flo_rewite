import 'package:floo_aid_rewrite/core/services/location_service.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/utils/get_distance_difference_to_dropoff_points.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_cordinates_entity.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_points_entity.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/bloc/drop_off_points_bloc.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/widgets/drop_off_points_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyDropOffPoints extends StatefulWidget {
  const NearbyDropOffPoints({super.key});

  @override
  State<NearbyDropOffPoints> createState() => _NerbyDropOffPointsState();
}

class _NerbyDropOffPointsState extends State<NearbyDropOffPoints> {
  Position? _currentPosition; 
  bool showAllDropOffPoints = false;  
  List<DropOffPointsEntity> points = [];
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
     context.read<DropOffPointsBloc>().add(const FetchDropOffPointsEvent());
    _fetchDeviceLocation();
    _sharedPreffrenceInstance();
  }


Future<void> _sharedPreffrenceInstance()async{
  prefs = await SharedPreferences.getInstance();

}

   Future<void> _fetchDeviceLocation() async {
    final location = await LocationService.getLocationWithPlacemark();
    if (location != null && mounted) {
      setState(() {
        _currentPosition = location['position'] as Position;
       });
    }
  }
//TODO: here the url string should be dynamic from db
void _launchCaller() async {
    const urlString = 'tel:+254729986926';
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $urlString';
    }
}

Future<void> openMapsWithPlaceName({
  required double latitude,
  required double longitude,
  required String placeName,
}) async {
  final String googleUrl = 
      'comgooglemaps://?q=${Uri.encodeComponent(placeName)}@$latitude,$longitude';
  final String appleUrl = 
      'https://maps.apple.com/?q=${Uri.encodeComponent(placeName)}&ll=$latitude,$longitude';

  final String fallbackUrl = 
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(placeName)}@$latitude,$longitude';

  final Uri googleMapsUri = Uri.parse(googleUrl);
  final Uri appleMapsUri = Uri.parse(appleUrl);
  final Uri fallbackUri = Uri.parse(fallbackUrl);

  if (await canLaunchUrl(googleMapsUri)) {
    await launchUrl(googleMapsUri);
  } else if (await canLaunchUrl(appleMapsUri)) {
    await launchUrl(appleMapsUri);
  } else if (await canLaunchUrl(fallbackUri)) {
    await launchUrl(fallbackUri);
  } else {
    throw 'Could not launch maps.';
  }
}
    
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        smallVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Drop Off Locations',
              style: veryBoldSize18Text(AppColors.deepNavy),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showAllDropOffPoints = !showAllDropOffPoints;
                });
              },
              child: Text(
                showAllDropOffPoints ? 'View All' : 'Show Nearby', 
                style: veryBoldSize14Text(AppColors.floaidPurple))),
          ],
        ),
        smallVerticalSizedBox,
        Expanded(
          child: BlocConsumer<DropOffPointsBloc, DropOffPointsState>(
            listener: (context, state) {},
            builder: (context, state) {
               if (state.errorMessage != null && state.errorMessage!.isNotEmpty){
                return Center(child: Text(state.errorMessage!));
              }else{
                final allDropOffPoints = state.dropOffPoints ?? [];
                final nerbyDropOffPoints = allDropOffPoints.where((point)   {
                    final distance = getDistanceDiffrenceToDropOffPoints(
                       _currentPosition?.latitude ?? 0.0,
                        _currentPosition?.longitude ?? 0.0,
                        DropOffCoordinatesEntity(
                        latitude:point.coordinates.latitude,
                        longitude: point.coordinates.longitude                  
                        ) 
                      );
                      return distance < 6; 

                  }).toList();
                context.read<DropOffPointsBloc>().add(GetNearbyDropOffLocationLengthEvent(nearbyLocationLength: nerbyDropOffPoints.length));
                if (prefs != null) {
                   prefs!.setInt('nearbyLocationLength', nerbyDropOffPoints.length);
                 }
                points = !showAllDropOffPoints ? allDropOffPoints :  nerbyDropOffPoints;

            return  Skeletonizer(
              enabled: state.isLoading == true,
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: points.length,
                  itemBuilder: (context, index) {  
                    final point = points[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: DropOffPointsCard(
                        title: point.name,
                        address: point.address,
                        distance: getDistanceDiffrenceToDropOffPoints(
                         _currentPosition?.latitude ?? 0.0,
                          _currentPosition?.longitude ?? 0.0,
                          DropOffCoordinatesEntity(
                          latitude:point.coordinates.latitude,
                          longitude: point.coordinates.longitude                  
                          ) 
                        ),
                        availabilityStatus: point.availabilityStatus,
                        urgencyLevel: point.urgencyLevel,
                        currentStock: point.stockLevel.current,
                        maxCapacity: point.stockLevel.capacity,
                        stockPercentage: point.stockLevel.percentage,
                        iconType: point.iconType,
                        updatedTime: point.updatedTime,
                        onCall: _launchCaller,
                        onDirections: () => openMapsWithPlaceName(
                          latitude: point.coordinates.latitude,
                          longitude: point.coordinates.longitude,
                          placeName: point.name,
                        ),
                      ),
                    );
                  },
                ),
            );}
            },
          ),
        ),
      ],
    );
  }
}

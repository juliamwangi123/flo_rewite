import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/bloc/drop_off_points_bloc.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/widgets/drop_off_points_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NerbyDropOffPoints extends StatefulWidget {
  const NerbyDropOffPoints({super.key});

  @override
  State<NerbyDropOffPoints> createState() => _NerbyDropOffPointsState();
}

class _NerbyDropOffPointsState extends State<NerbyDropOffPoints> {
  @override
  void initState() {
    super.initState();
     context.read<DropOffPointsBloc>().add(const FetchDropOffPointsEvent());
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
              'Nearby Locations',
              style: veryBoldSize18Text(AppColors.deepNavy),
            ),
            Text('View All', style: veryBoldSize14Text(AppColors.floaidPurple)),
          ],
        ),
        smallVerticalSizedBox,
        Expanded(
          child: BlocConsumer<DropOffPointsBloc, DropOffPointsState>(
            listener: (context, state) {},
            builder: (context, state) {
               if(state.isLoading == true) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.errorMessage != null && state.errorMessage!.isNotEmpty){
                return Center(child: Text(state.errorMessage!));
              }else{
            return  ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: state.dropOffPoints?.length ?? 0,
                itemBuilder: (context, index) {
                  final point = state.dropOffPoints![index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: DropOffPointsCard(
                      title: point.name,
                      address: point.address,
                      distance: '0', 
                      availabilityStatus: point.availabilityStatus,
                      urgencyLevel: point.urgencyLevel,
                      currentStock: point.stockLevel.current,
                      maxCapacity: point.stockLevel.capacity,
                      stockPercentage: point.stockLevel.percentage,
                      iconType: point.iconType,
                      updatedTime: point.updatedTime,
                    ),
                  );
                },
              );}
            },
          ),
        ),
      ],
    );
  }
}

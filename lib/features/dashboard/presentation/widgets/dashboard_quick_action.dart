import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/bloc/drop_off_points_bloc.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/quick_action_card.dart';
import 'package:floo_aid_rewrite/features/home/presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardQuickActionWidget extends StatefulWidget {
  const DashboardQuickActionWidget({super.key});

  @override
  State<DashboardQuickActionWidget> createState() =>
      _DashboardQuickActionWidgetState();
}

class _DashboardQuickActionWidgetState
    extends State<DashboardQuickActionWidget> {
  int nearbyLocations = 0;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    if (mounted) {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        nearbyLocations = prefs.getInt('nearbyLocationLength') ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<DropOffPointsBloc, DropOffPointsState>(
            builder: (context, state) {
              return QuickActionCardWidget(
                icon: Icons.location_pin,
                color: AppColors.aquaTeal,
                title: 'Find Drop-off',
                subtitle:
                    '${state.nearbyLocationLength ?? nearbyLocations} nearby',
                onTap: () {
                  context.read<NavigationBloc>().add(
                    const ChangeCurrentEvent(currentIndex: 1),
                  );
                },
              );
            },
          ),

          QuickActionCardWidget(
            icon: Icons.calendar_month_outlined,
            color: AppColors.floaidPurple,
            title: 'Schedule Pick-up ',
            subtitle: 'Tomorrow',
            onTap: () {
              // Handle health tips action
            },
          ),
        ],
      ),
    );
  }
}

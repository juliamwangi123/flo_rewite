import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/pages/collection_points.dart';
import 'package:floo_aid_rewrite/features/stories/presentation/pages/stories.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/pages/dashboard.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/dashboard_appbar.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/drawer.dart';
import 'package:floo_aid_rewrite/features/donations/presentation/pages/donation.dart';
import 'package:floo_aid_rewrite/features/home/presentation/bloc/navigation_bloc.dart';
import 'package:floo_aid_rewrite/features/home/presentation/widget/bottom_nav.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/pages/schedule_pick_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final int? pageIndx;
  const HomePage({super.key, this.pageIndx});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
void initState() {
  super.initState();
 WidgetsBinding.instance.addPostFrameCallback((_) {
  if(widget.pageIndx !=null){
     context.read<NavigationBloc>().add(ChangeCurrentEvent(currentIndex:widget.pageIndx!));
  }
 
});
  
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: BlocConsumer<NavigationBloc, NavigationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  const DashboardAppbar(),
                  Expanded(
                    child: screens[ state.currentIndex],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNav(),
      drawer: DashboardDrawer(),
    );
  }
}

List<Widget> screens = [
  const DashboardScreen(),
  const CollectionPoints(),
  const SchedulePickUpScreen(),
  const DonationScreen(),
  const StoriesPage(),
];

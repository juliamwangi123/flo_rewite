import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      elevation: 3,
          currentIndex: 0,
          selectedItemColor: AppColors.floaidPink,
          unselectedItemColor: AppColors.lightGray,
          backgroundColor: AppColors.softWhite,
          type: BottomNavigationBarType.fixed,
            items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Pickups',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cube),
              label: 'Donations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: 'Community',
            ),
          ],
      );
  }
}
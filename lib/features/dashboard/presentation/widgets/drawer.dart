import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/drawer_header.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/drawer_item.dart';

class DashboardDrawer extends StatelessWidget {
  DashboardDrawer({super.key});

  final List<Map<String, dynamic>> toolItems = [
    {'title': 'Dashboard', 'icon': Icons.favorite_outline},
    {'title': 'Analytics', 'icon': Icons.analytics_outlined},
    {'title': 'Inventory', 'icon': Icons.inventory_2_outlined},
    {'title': 'Volunteers', 'icon': Icons.group_add_outlined},
  ];

  final List<Map<String, dynamic>> accountItems = [
    {'title': 'Settings', 'icon': Icons.settings_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const CustomDrawerHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14).copyWith(top:30),
            child: Text('TOOLS', style:boldSize15Text()),
          ),
          ...toolItems.map(
            (item) => DrawerItem(
              leadingIcon: item['icon'],
              title: item['title'],
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Text('ACCOUNT', style:boldSize15Text()),
          ),
          ...accountItems.map(
            (item) => DrawerItem(
              leadingIcon: item['icon'],
              title: item['title'],
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
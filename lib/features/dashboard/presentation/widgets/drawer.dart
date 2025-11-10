import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/drawer_header.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/drawer_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardDrawer extends StatelessWidget {
  DashboardDrawer({super.key});

  final List<Map<String, dynamic>> toolItems = [
    {'title': 'Dashboard', 'icon': Icons.favorite_outline, 'onTap': () {}},
    {'title': 'Analytics', 'icon': Icons.analytics_outlined, 'onTap': () {}},
    {'title': 'Inventory', 'icon': Icons.inventory_2_outlined, 'onTap': () {}},
    {'title': 'Volunteers', 'icon': Icons.group_add_outlined, 'onTap': () {}},
  ];

  final List<Map<String, dynamic>> accountItems = [
    {'title': 'Settings', 'icon': Icons.settings_outlined, 'onTap': () {}},
    {'title': 'Logout', 'icon': Icons.logout_outlined, 'onTap': () {}},
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ).copyWith(top: 30),
            child: Text('TOOLS', style: boldSize15Text()),
          ),
          ...toolItems.map(
            (item) => DrawerItem(
              leadingIcon: item['icon'],
              title: item['title'],
              onTap: item['onTap'],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Text('ACCOUNT', style: boldSize15Text()),
          ),
          ...accountItems.map(
            (item) => BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if(state.user == null ){
                //  Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                   context.push( AppRoutes.loginRoute);

                }
              },
              builder: (context, state) {
                return DrawerItem(
                  leadingIcon: item['icon'],
                  title: item['title'],
                  onTap:
                      item['title'] == 'Logout'
                          ? () {
                            context.read<AuthBloc>().add(
                              const SignOutUserEvent(),
                            );
                            //  Navigator.pushReplacementNamed(context,);
                             context.push( AppRoutes.loginRoute);

                          }
                          : item['onTap'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

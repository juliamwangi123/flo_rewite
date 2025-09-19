// services/deep_link_service.dart
import 'package:app_links/app_links.dart';
import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:flutter/material.dart';

class DeepLinkService {
  static final AppLinks _appLinks = AppLinks();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> initialize() async {
    try {
      final initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _handleDeepLink(initialLink);
        });
      }

      _appLinks.uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          _handleDeepLink(uri);
        }
      });
    } catch (e) {
      throw ('Deep link initialization error: $e');
    }
  }

  static void _handleDeepLink(Uri uri) {
    if (uri.scheme == 'floaid' && uri.host == 'reset-password') {
      final oobCode = uri.queryParameters['oobCode'];
      if (oobCode != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigatorKey.currentState?.pushNamed(
            AppRoutes.newPasswordScreen,
            arguments: oobCode,
          );
        });
      }
    }
  }
}
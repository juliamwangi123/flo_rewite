import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      fontFamily: 'Lexend',
      primaryColor: AppColors.themeColors.primaryColor,
      primaryColorDark: AppColors.themeColors.primaryDark,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.themeColors.textSelectionColor,
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.themeColors.primaryColor,
        secondary: AppColors.themeColors.accentColor,
        // surface: AppColors.softWhite,
        surface: AppColors.themeColors.backgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.deepNavy,
      ).copyWith(surface: AppColors.themeColors.backgroundColor),
    );
  }
}

class AppColors {
  static ThemeColors themeColors = ThemeColors(
    floaidPink,
    floaidPurple,
    empowermentTeal,
    softBackground,
    highlightPink,
  );

  // --- Original FloAid Colors ---
  static const Color floaidPink = Color(0xFFE91E63);
  static const Color floaidPurple = Color(0xFF9C27B0);
  static const Color empowermentTeal = Color(0xFF00BCD4);
  static const Color compassionateBlue = Color(0xFF2196F3);
  static const Color hopefulGreen = Color(0xFF4CAF50);
  static const Color gradientStart = floaidPink;
  static const Color gradientEnd = floaidPurple;
  static const Color softBackground = Color(0xFFFDF2F8);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color lightBackground = Color(0xFFF8F9FA);
  static const Color deepNavy = Color(0xFF1E293B);
  static const Color mediumGray = Color(0xFF64748B);
  static const Color lightGray = Color(0xFF94A3B8);
  static const Color mutedText = Color(0xFFCBD5E1);
  static const Color highlightPink = Color(0xFFEC4899);
  static const Color activeState = Color(0xFFBE185D);
  static const Color hoverState = Color(0xFFF3E8FF);
  static const Color successGreen = Color(0xFF10B981);
  static const Color warningAmber = Color(0xFFF59E0B);
  static const Color errorRed = Color(0xFFEF4444);
  static const Color infoBlue = Color(0xFF3B82F6);
  static const Color softWhite = Color(0xFFFAFAFA);
  static const Color borderGray = Color(0xFFE2E8F0);
  static const Color shadowGray = Color(0x1A000000);

  // --- Legacy / Custom Additions ---
  static const Color primaryPink = floaidPink;
  static const Color blushPink = Color(0xFFD3A39F);
  static const Color softPinkAccent = Color(0xFFD6A8A3);
  static const Color palePink = Color(0xFFE2B6A5);
  static const Color mutedGray = Color(0xFFC1BAB6);
  static const Color warmBeige = Color(0xFFC4BBB8);
  static const Color lightPeachBackground = Color(0xFFDFB6AC);
  static const Color textSelectionTeal = empowermentTeal;
  static const Color backgroundColor = softBackground;
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color deepBlue = Color(0xFF00212D);
  static const Color borderColor = Color(0xFFFFC0CB);
  static const Color lavendarColor = Color(0xFFDCE3F9);
  static const Color lightGreen = Color(0xFFDBFAF3);
  static const Color lighterShadeGreen = Color(0xffDBFAF3);
  static const Color mintGreen = Color(0xff81C784);
  static const Color lightSkyBlue = Color(0xFF64B5F6);
  static const Color softPink = Color.fromARGB(255, 239, 210, 221);
  static const Color brightPink = Color(0xFFFF8AB5);
  static const Color mintBlue = Color(0xFFD2FEF6);
  static const Color darkGrayishBlue = Color(0xFF70808C);
  static const Color darkGray = Color(0xFF292C2B);
  static const Color softAqua = Color(0xFF96E3E1);
  static const Color lightGrayishGreen = Color(0xFFC0CBC4);
  static const Color paleGray = Color(0xFFDCE0DF);
  static const Color lightCyan = Color(0xFFEBF2F4);
  static const Color teal = Color(0xFF2BA3A7);
  static const Color offWhite = Color(0xFFEEF2F0);
  static const Color lightMint = Color(0xFFC0FBF4);
  static const Color coolGray = Color(0xFFE0E7EF);
  static const Color blueGray = Color(0xFFA4B2B9);
  static const Color steelBlue = Color(0xFF99A4AC);
  static const Color aquaTeal = Color(0xFF52B4B0);
  static const Color mediumGrey = Color(0xFF4B5563);
  static const Color veryLightGray = Color(0xFFF3F4F6);
  static const Color hintTextColor = Color(0xFFB3B3B3);
 static  const Color lightGreenish = Color(0xFFDCFCE7);
 static  const Color darkGreen = Color(0xFF15803D); 
  

  // --- Gradients ---
  static LinearGradient get primaryGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [gradientStart, gradientEnd],
      );

  static LinearGradient get backgroundGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [softBackground, lightBackground],
      );

  static LinearGradient get cardGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          cardBackground,
          softBackground.withValues(alpha: 0.5),
        ],
      );
}

class ThemeColors {
  final Color primaryColor;
  final Color primaryDark;
  final Color accentColor;
  final Color backgroundColor;
  final Color textSelectionColor;

  ThemeColors(
    this.primaryColor,
    this.primaryDark,
    this.accentColor,
    this.backgroundColor,
    this.textSelectionColor,
  );
}

class FloAidColorSchemes {
  static const List<Color> primaryAction = [
    AppColors.floaidPink,
    AppColors.floaidPurple,
  ];

  static const List<Color> success = [
    AppColors.successGreen,
    AppColors.hopefulGreen,
  ];

  static const List<Color> support = [
    AppColors.empowermentTeal,
    AppColors.compassionateBlue,
  ];

  static const List<Color> warmBackground = [
    AppColors.softBackground,
    AppColors.lightBackground,
  ];
}

import 'package:flutter/material.dart';

class AppTheme {
  // Primary Colors
  static const Color primaryGold = Color(0xFFF9C623);
  static const Color secondaryNavy = Color(0xFF001122);
  static const Color darkNavy = Color(0xFF001122);
  static const Color lightNavy = Color(0xFF002244);

  // Background Colors
  static const Color backgroundBlack = Colors.black;
  static const Color cardBackground = Color(0xFF001122);
  static const Color headerGrey = Color(0xFFEEEEEE);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFCCCCCC);
  static const Color textGrey = Color(0xFF666666);

  // Status Colors
  static const Color successGreen = Colors.green;
  static const Color errorRed = Colors.red;
  static const Color warningYellow = Colors.yellow;
  static const Color infoBlue = Colors.blue;

  // Rank Colors
  static const Color goldRank = Color(0xFFF9C623);
  static const Color silverRank = Colors.white;
  static const Color bronzeRank = Color(0xFFCD7F32);
  static const Color diamondRank = Colors.blue;
  static const Color emperorRank = Colors.purple;

  // Tournament Status Colors
  static const Color liveStatus = Colors.red;
  static const Color upcomingStatus = Colors.blue;
  static const Color fullStatus = Colors.grey;
  static const Color vipStatus = Colors.purple;

  // Social Colors
  static const Color facebookBlue = Color(0xFF1877F2);
  static const Color googleRed = Color(0xFFDB4437);
  static const Color whatsappGreen = Color(0xFF25D366);

  // Section Background Colors (with opacity)
  static Color kycBackground = Colors.blueGrey.withValues(alpha: 0.1);
  static Color securityBackground = Colors.orange.withValues(alpha: 0.1);
  static Color settingsBackground = Colors.purple.withValues(alpha: 0.1);
  static Color supportBackground = Colors.green.withValues(alpha: 0.1);

  // Gradient Colors
  static const List<Color> royalGradient = [
    Color(0xFF001122),
    Color(0xFF002244),
  ];

  static const List<Color> goldGradient = [
    Color(0xFFF9C623),
    Color(0xFFFFD700),
  ];

  // Glow Effects
  static BoxShadow goldGlow = BoxShadow(
    color: primaryGold.withValues(alpha: 0.3),
    blurRadius: 20,
    spreadRadius: 5,
    offset: const Offset(0, 5),
  );

  static BoxShadow softGoldGlow = BoxShadow(
    color: primaryGold.withValues(alpha: 0.2),
    blurRadius: 10,
    spreadRadius: 2,
  );

  // Card Decorations
  static BoxDecoration cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: primaryGold, width: 2),
    boxShadow: [goldGlow],
    gradient: LinearGradient(
      colors: [
        textPrimary.withValues(alpha: 0.1),
        textPrimary.withValues(alpha: 0.05),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static BoxDecoration championCardDecoration(bool isTopThree) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: primaryGold,
        width: isTopThree ? 3 : 1,
      ),
      boxShadow: [
        BoxShadow(
          color: isTopThree
              ? primaryGold.withValues(alpha: 0.6)
              : primaryGold.withValues(alpha: 0.3),
          blurRadius: isTopThree ? 20 : 10,
          spreadRadius: isTopThree ? 5 : 2,
        ),
      ],
      gradient: const LinearGradient(
        colors: royalGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  // Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primaryGold,
        secondary: secondaryNavy,
        surface: Colors.white,
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        onSurface: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryGold,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: primaryGold,
        secondary: secondaryNavy,
        surface: cardBackground,
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        onSurface: textPrimary,
      ),
      scaffoldBackgroundColor: backgroundBlack,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundBlack,
        foregroundColor: primaryGold,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: cardBackground,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        shadowColor: primaryGold,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: backgroundBlack,
        selectedItemColor: primaryGold,
        unselectedItemColor: textSecondary,
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: primaryGold,
        unselectedLabelColor: textSecondary,
        indicatorColor: primaryGold,
      ),
    );
  }

  // Helper methods
  static Color getRankColor(int rank) {
    switch (rank) {
      case 1:
        return goldRank;
      case 2:
        return silverRank;
      case 3:
        return bronzeRank;
      default:
        return textGrey;
    }
  }

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'live':
        return liveStatus;
      case 'upcoming':
        return upcomingStatus;
      case 'full':
        return fullStatus;
      case 'vip':
        return vipStatus;
      default:
        return textGrey;
    }
  }

  static BoxShadow getRankGlow(int rank) {
    if (rank <= 3) {
      return BoxShadow(
        color: getRankColor(rank).withValues(alpha: 0.5),
        blurRadius: 10,
        spreadRadius: 2,
      );
    }
    return const BoxShadow();
  }
}

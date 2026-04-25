import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/main_layout.dart';

void main() {
  runApp(const PalestineCitiesApp());
}

class PalestineCitiesApp extends StatelessWidget {
  const PalestineCitiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Palestine Cities Explorer',
      theme: _buildPalestinianTheme(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildPalestinianTheme() {
    return ThemeData(
      primaryColor: const Color(0xFF8B4513),
      primarySwatch: _createMaterialColor(const Color(0xFF8B4513)),
      scaffoldBackgroundColor: const Color(0xFFFDFBF7),
      
      // ========== APP BAR THEME - Centered, No Emojis, Custom Font ==========
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF2C4A2E),
        foregroundColor: const Color(0xFFFFD700),
        elevation: 0,
        centerTitle: true, // This centers the title!
        titleTextStyle: GoogleFonts.playfairDisplay(
          color: const Color(0xFFFFD700),
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFFFD700),
          size: 24,
        ),
      ),
      
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFFFDFBF7),
        elevation: 4,
      ),
      
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF2C4A2E),
        selectedItemColor: Color(0xFFFFD700),
        unselectedItemColor: Color(0xFFD4C4A8),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      cardTheme: const CardThemeData(
        color: Color(0xFFF0EBE1),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2C4A2E),
          foregroundColor: const Color(0xFFFFD700),
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      // ========== GLOBAL TEXT THEME with Custom Fonts ==========
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2C4A2E),
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2C4A2E),
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2C4A2E),
        ),
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF8B4513),
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF8B4513),
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontSize: 16,
          height: 1.5,
          color: const Color(0xFF2C2C2C),
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 14,
          height: 1.4,
          color: const Color(0xFF4A4A4A),
        ),
        labelLarge: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF8B4513), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD4C4A8), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFFD700), width: 2),
        ),
      ),
      
      dividerTheme: const DividerThemeData(
        color: Color(0xFFD4C4A8),
        thickness: 1,
        space: 20,
      ),
      
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFFF0EBE1),
        selectedColor: const Color(0xFFFFD700),
        labelStyle: GoogleFonts.montserrat(color: const Color(0xFF2C4A2E)),
        secondaryLabelStyle: GoogleFonts.montserrat(color: const Color(0xFF2C4A2E)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      
      iconTheme: const IconThemeData(
        color: Color(0xFF8B4513),
        size: 24,
      ),
      
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFFD700),
        foregroundColor: Color(0xFF2C4A2E),
      ),
      
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const MainLayout(selectedIndex: 0),
    ),
    GoRoute(
      path: '/jerusalem',
      name: 'jerusalem',
      builder: (context, state) => const MainLayout(selectedIndex: 1),
    ),
    GoRoute(
      path: '/bethlehem',
      name: 'bethlehem',
      builder: (context, state) => const MainLayout(selectedIndex: 2),
    ),
    GoRoute(
      path: '/hebron',
      name: 'hebron',
      builder: (context, state) => const MainLayout(selectedIndex: 3),
    ),
    GoRoute(
      path: '/nablus',
      name: 'nablus',
      builder: (context, state) => const MainLayout(selectedIndex: 4),
    ),
    GoRoute(
      path: '/ramallah',
      name: 'ramallah',
      builder: (context, state) => const MainLayout(selectedIndex: 5),
    ),
    GoRoute(
      path: '/jericho',
      name: 'jericho',
      builder: (context, state) => const MainLayout(selectedIndex: 6),
    ),
    GoRoute(
      path: '/nazareth',
      name: 'nazareth',
      builder: (context, state) => const MainLayout(selectedIndex: 7),
    ),
    GoRoute(
      path: '/jaffa',
      name: 'jaffa',
      builder: (context, state) => const MainLayout(selectedIndex: 8),
    ),
  ],
);
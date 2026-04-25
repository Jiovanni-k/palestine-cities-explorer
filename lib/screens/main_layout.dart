import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';
import 'home_screen.dart';
import 'jerusalem_screen.dart';
import 'bethlehem_screen.dart';
import 'hebron_screen.dart';
import 'nablus_screen.dart';
import 'ramallah_screen.dart';
import 'jericho_screen.dart';
import 'nazareth_screen.dart';
import 'jaffa_screen.dart';

class MainLayout extends StatefulWidget {
  final int selectedIndex;
  
  const MainLayout({super.key, required this.selectedIndex});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _selectedIndex;
  
  final List<Widget> _screens = [
    const HomeScreen(),
    const JerusalemScreen(),
    const BethlehemScreen(),
    const HebronScreen(),
    const NablusScreen(),
    const RamallahScreen(),
    const JerichoScreen(),
    const NazarethScreen(),
    const JaffaScreen(),
  ];
  
  final List<String> _routes = [
    '/', '/jerusalem', '/bethlehem', '/hebron', '/nablus',
    '/ramallah', '/jericho', '/nazareth', '/jaffa',
  ];
  
  final List<String> _titles = [
    'Palestine Cities Explorer',
    'Jerusalem - The Holy City',
    'Bethlehem - Birthplace of Jesus',
    'Hebron - City of Patriarchs',
    'Nablus - City of Kunafa',
    'Ramallah - Cultural Capital',
    'Jericho - Oldest City on Earth',
    'Nazareth - Childhood Home of Jesus',
    'Jaffa - Ancient Port City',
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: GoogleFonts.playfairDisplay(
            fontSize: ResponsiveHelper.getFontSize(context, 18),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2C4A2E), Color(0xFF1B2E1B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      
      // Responsive Drawer - Fixed width on desktop
      drawer: ResponsiveHelper.isDesktop(context)
          ? Container(
              width: ResponsiveHelper.getDrawerWidth(context),
              child: _buildDrawerContent(),
            )
          : Drawer(
              child: _buildDrawerContent(),
            ),
      
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFDFBF7), Color(0xFFF0EBE1)],
          ),
        ),
        child: _screens[_selectedIndex],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: "Jerusalem"),
          BottomNavigationBarItem(icon: Icon(Icons.nature_people), label: "Bethlehem"),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: "Hebron"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Nablus"),
          BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: "Ramallah"),
          BottomNavigationBarItem(icon: Icon(Icons.terrain), label: "Jericho"),
          BottomNavigationBarItem(icon: Icon(Icons.church), label: "Nazareth"),
          BottomNavigationBarItem(icon: Icon(Icons.beach_access), label: "Jaffa"),
        ],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: ResponsiveHelper.getFontSize(context, 12),
        unselectedFontSize: ResponsiveHelper.getFontSize(context, 12),
      ),
    );
  }

  Widget _buildDrawerContent() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFDFBF7), Color(0xFFF0EBE1)],
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: ResponsiveHelper.isMobile(context) ? 140 : 160,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C4A2E), Color(0xFF1B2E1B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.landscape,
                    size: ResponsiveHelper.isMobile(context) ? 32 : 40,
                    color: const Color(0xFFFFD700),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Palestine Cities',
                    style: GoogleFonts.playfairDisplay(
                      color: const Color(0xFFFFD700),
                      fontSize: ResponsiveHelper.getFontSize(context, 18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Explorer',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFFD4C4A8),
                      fontSize: ResponsiveHelper.getFontSize(context, 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildDrawerItem(Icons.home, 'Home', '/', 0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Divider(color: Color(0xFFD4C4A8)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Text(
              'EXPLORE CITIES',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B4513),
                letterSpacing: 1,
              ),
            ),
          ),
          _buildDrawerItem(Icons.location_city, 'Jerusalem', '/jerusalem', 1),
          _buildDrawerItem(Icons.nature_people, 'Bethlehem', '/bethlehem', 2),
          _buildDrawerItem(Icons.place, 'Hebron', '/hebron', 3),
          _buildDrawerItem(Icons.map, 'Nablus', '/nablus', 4),
          _buildDrawerItem(Icons.local_cafe, 'Ramallah', '/ramallah', 5),
          _buildDrawerItem(Icons.terrain, 'Jericho', '/jericho', 6),
          _buildDrawerItem(Icons.church, 'Nazareth', '/nazareth', 7),
          _buildDrawerItem(Icons.beach_access, 'Jaffa', '/jaffa', 8),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.3)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_flags, size: 16, color: Color(0xFF8B4513)),
                SizedBox(width: 8),
                Text(
                  'Palestine - Land of Olives',
                  style: TextStyle(fontSize: 11, color: Color(0xFF2C4A2E), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, String route, int index) {
    final isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xFFFFD700) : const Color(0xFF8B4513),
        size: 22,
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          color: isSelected ? const Color(0xFFFFD700) : const Color(0xFF2C4A2E),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
      trailing: isSelected
          ? Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD700),
                shape: BoxShape.circle,
              ),
            )
          : null,
      tileColor: isSelected ? const Color(0xFF2C4A2E).withOpacity(0.1) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          _selectedIndex = index;
        });
        context.go(route);
      },
    );
  }
}
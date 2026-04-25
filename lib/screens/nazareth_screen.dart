import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class NazarethScreen extends StatelessWidget {
  const NazarethScreen({super.key});

  void _nextCity(BuildContext context) {
    context.go('/jaffa');
  }

  void _previousCity(BuildContext context) {
    context.go('/jericho');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getScreenPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ResponsiveHelper.isMobile(context) ? 15 : 20),
            child: Image.asset(
              'assets/images/nazareth/main.jpg',
              height: ResponsiveHelper.getImageHeight(context),
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: ResponsiveHelper.getImageHeight(context),
                color: Colors.grey[300],
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_not_supported, size: 50),
                      SizedBox(height: 8),
                      Text('Add main.jpg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Nazareth (الناصرة)',
            style: GoogleFonts.playfairDisplay(
              fontSize: ResponsiveHelper.getFontSize(context, 28),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Childhood Home of Jesus',
            style: GoogleFonts.montserrat(
              fontSize: ResponsiveHelper.getFontSize(context, 16),
              fontStyle: FontStyle.italic,
              color: const Color(0xFFA0522D),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📖 About Nazareth',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 20),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Nazareth is the largest Arab city in the region and is known as the "Arab capital" of Israel. It is believed to be where Jesus Christ spent his childhood, making it one of the most important pilgrimage destinations for Christians worldwide.',
                  style: GoogleFonts.montserrat(
                    fontSize: ResponsiveHelper.getFontSize(context, 14),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'The city sits in a beautiful valley surrounded by mountains and features a mix of ancient and modern architecture. Nazareth has a significant Christian population alongside Muslims.',
                  style: GoogleFonts.montserrat(
                    fontSize: ResponsiveHelper.getFontSize(context, 14),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context)),
            decoration: BoxDecoration(
              color: const Color(0xFF8B4513).withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF8B4513).withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '✨ Why Visit Nazareth?',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 18),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '• Visit the Basilica of the Annunciation\n'
                  '• See St. Joseph\'s Church (Joseph\'s workshop)\n'
                  '• Visit Mary\'s Well, where Mary drew water\n'
                  '• Explore the Nazareth Village\n'
                  '• Walk through the Old City markets\n'
                  '• Experience Arab Christian culture',
                  style: GoogleFonts.montserrat(
                    fontSize: ResponsiveHelper.getFontSize(context, 14),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '🏛️ Religious Sites',
            style: GoogleFonts.playfairDisplay(
              fontSize: ResponsiveHelper.getFontSize(context, 20),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: ResponsiveHelper.isMobile(context) ? 2 : 
                           ResponsiveHelper.isTablet(context) ? 3 : 4,
            crossAxisSpacing: ResponsiveHelper.getSpacing(context),
            mainAxisSpacing: ResponsiveHelper.getSpacing(context),
            childAspectRatio: 0.8,
            children: [
              _buildLandmarkCard(context, 'Basilica', 'assets/images/nazareth/basilica.jpg'),
              _buildLandmarkCard(context, 'St. Joseph\'s', 'assets/images/nazareth/st_joseph.jpg'),
              _buildLandmarkCard(context, 'Mary\'s Well', 'assets/images/nazareth/mary_well.jpg'),
              _buildLandmarkCard(context, 'Synagogue', 'assets/images/nazareth/synagogue.jpg'),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _previousCity(context),
                  icon: const Icon(Icons.arrow_back),
                  label: Text(
                    'Previous: Jericho',
                    style: GoogleFonts.montserrat(fontSize: ResponsiveHelper.getFontSize(context, 12)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C4A2E),
                    foregroundColor: const Color(0xFFFFD700),
                    padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.getSpacing(context)),
                  ),
                ),
              ),
              SizedBox(width: ResponsiveHelper.getSpacing(context)),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _nextCity(context),
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(
                    'Next: Jaffa',
                    style: GoogleFonts.montserrat(fontSize: ResponsiveHelper.getFontSize(context, 12)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C4A2E),
                    foregroundColor: const Color(0xFFFFD700),
                    padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.getSpacing(context)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLandmarkCard(BuildContext context, String title, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveHelper.getFontSize(context, 12),
                  color: const Color(0xFF5D3A1A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
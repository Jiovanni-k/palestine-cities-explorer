import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class NablusScreen extends StatelessWidget {
  const NablusScreen({super.key});

  void _nextCity(BuildContext context) {
    context.go('/ramallah');
  }

  void _previousCity(BuildContext context) {
    context.go('/hebron');
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
              'assets/images/nablus/main.jpg',
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
            'Nablus (نابلس)',
            style: GoogleFonts.playfairDisplay(
              fontSize: ResponsiveHelper.getFontSize(context, 28),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'The City of Kunafa - Ancient Shechem',
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
                  '📖 About Nablus',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 20),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Nablus is one of the oldest Palestinian cities, founded by the Roman Emperor Vespasian in 72 CE. The city is built between two mountains - Mount Ebal and Mount Gerizim.',
                  style: GoogleFonts.montserrat(
                    fontSize: ResponsiveHelper.getFontSize(context, 14),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Nablus is famous throughout the Middle East for its delicious Kunafa (a sweet cheese pastry), traditional olive oil soap, and vibrant Old City with its bustling markets.',
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
                  '✨ Why Visit Nablus?',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 18),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '• Taste the world-famous Kunafa Nabulsiyeh\n'
                  '• Visit the traditional soap factories\n'
                  '• Explore the ancient Samaritan community\n'
                  '• Walk through the historic Old City markets\n'
                  '• See Jacob\'s Well\n'
                  '• Experience traditional Palestinian hospitality',
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
            '🏛️ Famous Landmarks & Foods',
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
              _buildLandmarkCard(context, 'Kunafa', 'assets/images/nablus/kunafa.jpg'),
              _buildLandmarkCard(context, 'Mount Gerizim', 'assets/images/nablus/mount_gerizim.jpg'),
              _buildLandmarkCard(context, 'Old City', 'assets/images/nablus/old_city.jpg'),
              _buildLandmarkCard(context, 'Nablus Soap', 'assets/images/nablus/soap.jpg'),
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
                    'Previous: Hebron',
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
                    'Next: Ramallah',
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
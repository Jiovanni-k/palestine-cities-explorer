import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class RamallahScreen extends StatelessWidget {
  const RamallahScreen({super.key});

  void _nextCity(BuildContext context) {
    context.go('/jericho');
  }

  void _previousCity(BuildContext context) {
    context.go('/nablus');
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
              'assets/images/ramallah/main.jpg',
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
            'Ramallah (رام الله)',
            style: GoogleFonts.playfairDisplay(
              fontSize: ResponsiveHelper.getFontSize(context, 28),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Cultural Capital of Palestine',
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
                  '📖 About Ramallah',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 20),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Ramallah serves as the administrative capital of the Palestinian Authority. Originally a small farming village, it has grown into a vibrant, modern city that is the cultural and economic heart of Palestine.',
                  style: GoogleFonts.montserrat(
                    fontSize: ResponsiveHelper.getFontSize(context, 14),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Today, Ramallah is known for its lively atmosphere, international restaurants, art galleries, and cultural centers. It has become a hub for young Palestinians, artists, and entrepreneurs.',
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
                  '✨ Why Visit Ramallah?',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 18),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '• Experience Palestine\'s modern culture and art scene\n'
                  '• Visit the Mahmoud Darwish Museum\n'
                  '• Enjoy world-class restaurants and cafes\n'
                  '• See the Presidential Headquarters\n'
                  '• Explore the Yasser Arafat Museum\n'
                  '• Experience vibrant nightlife and live music',
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
            '🏛️ Cultural Attractions',
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
              _buildLandmarkCard(context, 'Al-Manara Square', 'assets/images/ramallah/manara_square.jpg'),
              _buildLandmarkCard(context, 'Darwish Museum', 'assets/images/ramallah/darwish_museum.jpg'),
              _buildLandmarkCard(context, 'Old City', 'assets/images/ramallah/old_city.jpg'),
              _buildLandmarkCard(context, 'Cultural Palace', 'assets/images/ramallah/cultural_palace.jpg'),
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
                    'Previous: Nablus',
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
                    'Next: Jericho',
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
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class JerichoScreen extends StatelessWidget {
  const JerichoScreen({super.key});

  void _nextCity(BuildContext context) {
    context.go('/nazareth');
  }

  void _previousCity(BuildContext context) {
    context.go('/ramallah');
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
              'assets/images/jericho/main.jpg',
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
            'Jericho (أريحا)',
            style: GoogleFonts.playfairDisplay(
              fontSize: ResponsiveHelper.getFontSize(context, 28),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'The Oldest City in the World',
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
                  '📖 About Jericho',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 20),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Jericho is believed to be one of the oldest continuously inhabited cities in the world, with evidence of settlement dating back 11,000 years! Located near the Jordan River in the West Bank, it is also the lowest city on Earth, sitting 258 meters below sea level.',
                  style: GoogleFonts.montserrat(
                    fontSize: ResponsiveHelper.getFontSize(context, 14),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'The city\'s warm climate and fertile soil make it famous for its date palms, banana plantations, and fresh produce. Jericho is mentioned numerous times in the Bible.',
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
                  '✨ Why Visit Jericho?',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 18),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '• Visit the Mount of Temptation (with cable car)\n'
                  '• Explore the ancient ruins of Tell es-Sultan\n'
                  '• See Hisham\'s Palace with its famous mosaic\n'
                  '• Taste the delicious Jericho dates\n'
                  '• Visit the Sycamore Tree of Zacchaeus\n'
                  '• Experience the warm, year-round climate',
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
            '🏛️ Famous Landmarks',
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
              _buildLandmarkCard(context, 'Mount of Temptation', 'assets/images/jericho/mount_temptation.jpg'),
              _buildLandmarkCard(context, 'Hisham\'s Palace', 'assets/images/jericho/hisham_palace.jpg'),
              _buildLandmarkCard(context, 'Tell es-Sultan', 'assets/images/jericho/tell_sultan.jpg'),
              _buildLandmarkCard(context, 'Sycamore Tree', 'assets/images/jericho/sycamore_tree.jpg'),
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
                    'Previous: Ramallah',
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
                    'Next: Nazareth',
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
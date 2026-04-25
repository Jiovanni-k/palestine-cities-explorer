import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class BethlehemScreen extends StatelessWidget {
  const BethlehemScreen({super.key});

  void _nextCity(BuildContext context) {
    context.go('/hebron');
  }

  void _previousCity(BuildContext context) {
    context.go('/jerusalem');
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
              'assets/images/bethlehem/main.jpg',
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
            'Bethlehem (بيت لحم)',
            style: GoogleFonts.playfairDisplay(
              fontSize: ResponsiveHelper.getFontSize(context, 28),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Birthplace of Jesus - City of Olive Groves',
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
                  '📖 About Bethlehem',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 20),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Bethlehem is a Palestinian city located in the West Bank, about 10 kilometers south of Jerusalem. It is known worldwide as the birthplace of Jesus Christ, making it one of the most important Christian pilgrimage destinations.',
                  style: GoogleFonts.montserrat(
                    fontSize: ResponsiveHelper.getFontSize(context, 14),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'The name "Bethlehem" means "House of Bread" in Hebrew and "House of Meat" in Arabic. The city is surrounded by beautiful hills covered with olive groves and vineyards.',
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
                  '✨ Why Visit Bethlehem?',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: ResponsiveHelper.getFontSize(context, 18),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '• Visit the Church of the Nativity, a UNESCO site\n'
                  '• See the Milk Grotto, where Mary nursed Jesus\n'
                  '• Explore Shepherd\'s Field, where angels appeared\n'
                  '• Shop for olive wood carvings\n'
                  '• Enjoy traditional Palestinian hospitality\n'
                  '• Visit during Christmas for magical celebrations',
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
              _buildLandmarkCard(context, 'Church of Nativity', 'assets/images/bethlehem/nativity.jpg'),
              _buildLandmarkCard(context, 'Milk Grotto', 'assets/images/bethlehem/milk_grotto.jpg'),
              _buildLandmarkCard(context, 'Shepherd\'s Field', 'assets/images/bethlehem/shepherds_field.jpg'),
              _buildLandmarkCard(context, 'Rachel\'s Tomb', 'assets/images/bethlehem/rachel_tomb.jpg'),
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
                    'Previous: Jerusalem',
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
                    'Next: Hebron',
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
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> cities = const [
    {
      'name': 'Jerusalem', 
      'route': '/jerusalem',
      'image': 'assets/images/jerusalem/card.jpg',
      'description': 'The Holy City - Capital of Palestine'
    },
    {
      'name': 'Bethlehem', 
      'route': '/bethlehem',
      'image': 'assets/images/bethlehem/card.jpg',
      'description': 'Birthplace of Jesus'
    },
    {
      'name': 'Hebron', 
      'route': '/hebron',
      'image': 'assets/images/hebron/card.jpg',
      'description': 'City of Patriarchs'
    },
    {
      'name': 'Nablus', 
      'route': '/nablus',
      'image': 'assets/images/nablus/card.jpg',
      'description': 'City of Kunafa'
    },
    {
      'name': 'Ramallah', 
      'route': '/ramallah',
      'image': 'assets/images/ramallah/card.jpg',
      'description': 'Cultural Capital'
    },
    {
      'name': 'Jericho', 
      'route': '/jericho',
      'image': 'assets/images/jericho/card.jpg',
      'description': 'Oldest City in the World'
    },
    {
      'name': 'Nazareth', 
      'route': '/nazareth',
      'image': 'assets/images/nazareth/card.jpg',
      'description': 'Childhood Home of Jesus'
    },
    {
      'name': 'Jaffa', 
      'route': '/jaffa',
      'image': 'assets/images/jaffa/card.jpg',
      'description': 'Ancient Port City'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFDFBF7), Color(0xFFF0EBE1)],
        ),
      ),
      child: ListView(
        padding: ResponsiveHelper.getScreenPadding(context),
        children: [
          const SizedBox(height: 20),
          
          // Palestine Main Image - Responsive size
          ClipRRect(
            borderRadius: BorderRadius.circular(ResponsiveHelper.isMobile(context) ? 15 : 20),
            child: Image.asset(
              'assets/images/palestine/palestine_flag.jpg',
              height: ResponsiveHelper.getImageHeight(context),
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: ResponsiveHelper.getImageHeight(context),
                  width: double.infinity,
                  color: const Color(0xFF8B4513).withOpacity(0.2),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_not_supported, size: 50, color: Color(0xFF8B4513)),
                        SizedBox(height: 8),
                        Text('Add Palestine flag image', style: TextStyle(color: Color(0xFF8B4513))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Title - Responsive font size
          Text(
            'Explore Palestinian Cities',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: ResponsiveHelper.getFontSize(context, 28),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          
          const SizedBox(height: 10),
          
          Text(
            'Discover the rich history, culture, and heritage of Palestine',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: ResponsiveHelper.getFontSize(context, 16),
              color: const Color(0xFFA0522D),
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Highlight Card - Responsive padding
          Container(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context) * 1.5),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFF8B4513), width: 1),
            ),
            child: Text(
              'From the ancient olive groves of Bethlehem to the bustling markets of Nablus,\n\nFrom the holy sites of Jerusalem to the vibrant culture of Ramallah,\n\ndiscover the beauty and heritage of 8 beautiful Palestinian cities.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: ResponsiveHelper.getFontSize(context, 14),
                height: 1.5,
              ),
            ),
          ),
          
          const SizedBox(height: 30),
          
          Text(
            'Featured Cities',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: ResponsiveHelper.getFontSize(context, 22),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Responsive Grid - Changes number of columns based on screen size
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ResponsiveHelper.getCrossAxisCount(context),
              crossAxisSpacing: ResponsiveHelper.getSpacing(context),
              mainAxisSpacing: ResponsiveHelper.getSpacing(context),
              childAspectRatio: ResponsiveHelper.getCardAspectRatio(context),
            ),
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];
              return GestureDetector(
                onTap: () {
                  context.go(city['route'] as String);
                },
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // City Image
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.asset(
                            city['image'] as String,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFF8B4513).withOpacity(0.2),
                                child: const Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                    color: Color(0xFF8B4513),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // City Name
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              city['name'] as String,
                              style: GoogleFonts.montserrat(
                                fontSize: ResponsiveHelper.getFontSize(context, 14),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF5D3A1A),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          
          const SizedBox(height: 40),
          
          // Did You Know Section
          Container(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context)),
            decoration: BoxDecoration(
              color: const Color(0xFF8B4513).withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lightbulb, color: Color(0xFFFFD700)),
                    const SizedBox(width: 10),
                    Text(
                      'Did You Know?',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: ResponsiveHelper.getFontSize(context, 20),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF8B4513),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                FactCard(
                  icon: Icons.eco,
                  fact: 'Palestine is home to some of the oldest olive trees in the world, with some trees estimated to be over 5,000 years old!',
                ),
                const SizedBox(height: 12),
                FactCard(
                  icon: Icons.history,
                  fact: 'Jericho, located in Palestine, is considered the oldest continuously inhabited city on Earth, dating back over 11,000 years.',
                ),
                const SizedBox(height: 12),
                FactCard(
                  icon: Icons.agriculture,
                  fact: 'Palestine produces some of the finest olive oil in the world, with over 9 million olive trees growing across the country.',
                ),
                const SizedBox(height: 12),
                FactCard(
                  icon: Icons.museum,
                  fact: 'Palestine has 15 UNESCO World Heritage Sites, including the Church of Nativity in Bethlehem and the Old City of Jerusalem.',
                ),
                const SizedBox(height: 12),
                FactCard(
                  icon: Icons.celebration,
                  fact: 'Palestinians celebrate over 20 cultural festivals each year, including the Olive Harvest Festival and the Jerusalem Festival.',
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context)),
            decoration: BoxDecoration(
              color: const Color(0xFF8B4513).withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.forest, color: Color(0xFF8B4513)),
                SizedBox(width: 8),
                Text(
                  'Palestine: A Land of Rich Heritage and Culture',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class FactCard extends StatelessWidget {
  final IconData icon;
  final String fact;

  const FactCard({
    super.key,
    required this.icon,
    required this.fact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.getSpacing(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF8B4513).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF8B4513).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 28, color: const Color(0xFF8B4513)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              fact,
              style: GoogleFonts.montserrat(
                fontSize: ResponsiveHelper.getFontSize(context, 13),
                height: 1.4,
                color: const Color(0xFF3D2B1F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
# 🇵🇸 Palestine Cities Explorer

[![Flutter](https://img.shields.io/badge/Flutter-3.11+-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.11+-blue.svg)](https://dart.dev)
[![Platform](https://img.shields.io/badge/platform-Windows%20|%20macOS%20|%20Linux%20|%20Web%20|%20Android%20|%20iOS-lightgrey)](https://flutter.dev)
[![Responsive](https://img.shields.io/badge/responsive-mobile%20%7C%20tablet%20%7C%20desktop-brightgreen)]()

> A comprehensive Flutter application showcasing the rich cultural heritage of Palestinian cities through an interactive, responsive interface.

---

## 📋 **Overview**

Palestine Cities Explorer is an educational mobile and web application developed as part of a Flutter assignment to demonstrate mastery of:

- **Named Routes & Navigation** – GoRouter implementation
- **Persistent UI Elements** – Navigation drawer & bottom navigation bar
- **Responsive Layouts** – Adaptive grid systems for mobile, tablet, and desktop
- **Custom Theming** – Culturally inspired color palette with Google Fonts
- **Rich Media Integration** – Local images with graceful error handling
- **Cross-Platform Compatibility** – Runs on Windows, Web, Android, and iOS

---

## 🏙️ **Cities Featured**

| # | City | Significance | Key Attractions |
|---|------|--------------|-----------------|
| 1 | **Jerusalem** | The Holy City, Capital of Palestine | Dome of the Rock, Al-Aqsa Mosque, Western Wall |
| 2 | **Bethlehem** | Birthplace of Jesus Christ | Church of Nativity, Milk Grotto, Shepherd's Field |
| 3 | **Hebron** | City of Patriarchs | Ibrahimi Mosque, Ancient Glassblowing |
| 4 | **Nablus** | City of Kunafa | Mount Gerizim, Traditional Soap Factories |
| 5 | **Ramallah** | Cultural Capital | Al-Manara Square, Darwish Museum |
| 6 | **Jericho** | Oldest City on Earth | Mount of Temptation, Hisham's Palace |
| 7 | **Nazareth** | Childhood Home of Jesus | Basilica of Annunciation, Mary's Well |
| 8 | **Jaffa** | Ancient Port City | Jaffa Port, Clock Tower, Flea Market |

---

## 🎨 **Design System**

### Color Palette

| Role | Color Name | Hex Code | Usage |
|------|------------|----------|-------|
| Primary | Deep Olive | `#2C4A2E` | AppBar, Bottom Navigation, Buttons |
| Accent | Palestinian Gold | `#FFD700` | Icons, Active States, Highlights |
| Secondary | Rich Earth | `#8B4513` | Headers, Borders |
| Background | Cream Parchment | `#FDFBF7` | Main Background |
| Surface | Aged Papyrus | `#F0EBE1` | Cards & Alternate Sections |

### Typography

| Element | Font | Style |
|---------|------|-------|
| Headings | Playfair Display | Serif, Elegant, Academic |
| Body Text | Montserrat | Sans-serif, Clean, Readable |
| Buttons | Montserrat | Semi-bold, 0.5 Letter Spacing |

### Responsive Breakpoints

| Device Class | Screen Width | Grid Columns | Card Height |
|--------------|--------------|--------------|-------------|
| Mobile | < 600px | 2 columns | 200px |
| Tablet | 600 - 1200px | 3 columns | 250px |
| Desktop | > 1200px | 4 columns | 300px |

---

## 🗂️ **Project Structure**
palestine-cities-explorer/
├── lib/
│ ├── main.dart # App entry point & theme configuration
│ ├── utils/
│ │ └── responsive_helper.dart # Responsive design utilities
│ └── screens/
│ ├── main_layout.dart # Persistent drawer & bottom nav wrapper
│ ├── home_screen.dart # Featured cities grid
│ ├── jerusalem_screen.dart # Jerusalem city details
│ ├── bethlehem_screen.dart # Bethlehem city details
│ ├── hebron_screen.dart # Hebron city details
│ ├── nablus_screen.dart # Nablus city details
│ ├── ramallah_screen.dart # Ramallah city details
│ ├── jericho_screen.dart # Jericho city details
│ ├── nazareth_screen.dart # Nazareth city details
│ └── jaffa_screen.dart # Jaffa city details
├── assets/
│ └── images/ # Local image assets
│ ├── palestine/
│ ├── jerusalem/
│ ├── bethlehem/
│ ├── hebron/
│ ├── nablus/
│ ├── ramallah/
│ ├── jericho/
│ ├── nazareth/
│ └── jaffa/
├── pubspec.yaml # Dependencies & asset declarations
└── README.md # Project documentation

text

---

## 🚀 **Installation & Setup**

### Prerequisites

| Requirement | Version |
|-------------|---------|
| Flutter SDK | 3.11.0 or higher |
| Dart SDK | 3.11.0 or higher |
| IDE | VS Code / Android Studio / IntelliJ |

### Step-by-Step Installation

```bash
# 1. Clone the repository
git clone https://github.com/Jiovanni-k/palestine-cities-explorer.git
cd palestine-cities-explorer

# 2. Install dependencies
flutter pub get

# 3. Run the application
flutter run

# 4. (Optional) Build for specific platforms
flutter build web      # Web version
flutter build windows  # Windows desktop
flutter build apk      # Android APK
Adding Local Images
The application expects images in the following structure:

text
assets/images/[city-name]/
├── card.jpg          # Thumbnail for home screen grid
├── main.jpg          # Hero image for city detail page
└── [landmark].jpg    # Landmark images (names match code references)
Note: Placeholder containers appear when images are missing – the app handles missing assets gracefully.

🧭 Navigation Features
Feature	Implementation	User Interaction
Named Routes	GoRouter configuration	URL-based navigation (especially for web)
Navigation Drawer	Left-side drawer menu	Access via ☰ hamburger icon or swipe
Bottom Navigation Bar	Persistent footer	Quick access to first 5 cities
City Navigation Arrows	Next/Previous buttons	Sequential browsing through all 8 cities
Home Screen Grid	Touch/click on city cards	Direct navigation to any city
🛠️ Technical Implementation
Key Dependencies
Package	Version	Purpose
go_router	^13.0.0	Declarative routing with named routes
google_fonts	^6.2.1	Custom typography (Playfair Display & Montserrat)
Core Concepts Demonstrated
dart
// 1. Named Routes with GoRouter
GoRoute(
  path: '/jerusalem',
  builder: (context, state) => const MainLayout(selectedIndex: 1),
)

// 2. Responsive Grid System
crossAxisCount: ResponsiveHelper.getCrossAxisCount(context),

// 3. Custom Theme with Palestinian Colors
primaryColor: const Color(0xFF8B4513),
scaffoldBackgroundColor: const Color(0xFFFDFBF7),

// 4. Persistent Layout Pattern
Scaffold(
  appBar: AppBar(...),
  drawer: Drawer(...),
  body: _screens[_selectedIndex],
  bottomNavigationBar: BottomNavigationBar(...),
)
📱 Device Compatibility
Platform	Supported	Testing Status
Windows Desktop	✅	Verified
Web (Chrome)	✅	Verified
Web (Edge)	✅	Verified
Android	✅	Should work
iOS	✅	Should work
macOS	✅	Should work
Linux	✅	Should work
📊 Assignment Requirements Checklist
Requirement	Status	Implementation
Multi-screen Flutter app	✅	9 screens (Home + 8 cities)
Named routes	✅	GoRouter with named paths
Navigation drawer	✅	Left-side drawer with all cities
Bottom navigation bar	✅	Persistent footer with 9 items
Container widget	✅	Used throughout for layout
Text widget	✅	All content uses Text
Row/Column	✅	Complex layouts using flex
Stack widget	✅	Image overlays and positioning
ListView	✅	Scrollable content in all screens
ListView.builder	✅	Dynamic landmark lists
GridView	✅	City grid and landmark grids
Buttons	✅	Navigation and action buttons
Image widget	✅	Local images with error handling
Card widget	✅	Material Design cards
AppBar	✅	Custom-themed app bar
Scaffold	✅	Material Design scaffold
🎯 Future Enhancements
Add search functionality for cities

Implement favorite/bookmark system

Add dark mode support

Integrate Google Maps API for location visualization

Add user reviews and ratings for each city

Implement offline caching of images

Add push notifications for new content

Create multi-language support (Arabic/English)

🤝 Contributing
This project was developed as an academic assignment. While not actively seeking contributions, feedback and suggestions are welcome.

🙏 Acknowledgments
Palestinian Ministry of Tourism – Cultural and historical information

Google Fonts – Playfair Display & Montserrat typography

Flutter Team – Comprehensive documentation and framework

Wikimedia Commons – Reference images and historical data

📧 Contact
Developer: Jiovanni Kitlo

GitHub: Jiovanni-k

Email: jiovannikitlo9@gmail.com

📝 Assignment Context
This application was developed as a final project for an Advanced Web Development course, demonstrating proficiency in:

Flutter framework and Dart programming language

Responsive UI/UX design principles

Navigation patterns and state management

Custom theming and material design

Asset management and image handling

Cross-platform development considerations

<div align="center">
⭐ If you found this project helpful, consider starring the repository!

Palestine – Land of Olives and Heritage

</div>
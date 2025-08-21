# Daily Quotes

A beautiful Flutter app that displays inspirational quotes with elegant animations and swipe navigation.

## Features

- 🎨 **Beautiful UI**: Elegant gradient background with modern typography
- 📱 **Responsive Design**: Works seamlessly on mobile and tablet devices
- ✨ **Smooth Animations**: AnimatedOpacity and AnimatedSwitcher for quote transitions
- 👆 **Swipe Navigation**: PageView implementation for browsing through quotes
- 🔄 **New Quote Button**: Fetch fresh quotes with loading indicators
- 🌐 **API Integration**: Uses Quotable API for random quotes
- 💫 **Visual Feedback**: Page indicators and haptic feedback

## Getting Started

### Prerequisites

- Flutter 3.0.0 or higher
- Dart 3.0.0 or higher

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd daily_quotes
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── models/
│   └── quote.dart         # Quote data model
├── screens/
│   └── home_screen.dart   # Main screen with PageView
├── services/
│   └── api_service.dart   # API integration service
└── widgets/
    └── quote_card.dart    # Reusable quote card widget
```

## API

This app uses the [Quotable API](https://api.quotable.io) to fetch random quotes.

## Customization

### Colors
The gradient background colors can be modified in `home_screen.dart`:

```dart
colors: [
  Color(0xFF667eea),  // Blue
  Color(0xFF764ba2),  // Purple
  Color(0xFFf093fb),  // Pink
],
```

### Typography
Font styles are defined in `main.dart` using the Playfair Display font family.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
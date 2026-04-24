# Flutter Template

A production-ready, multi-platform Flutter template with Firebase integration, clean architecture, and modern development practices.

## Overview

This project serves as a robust starting point for Flutter applications with:

- **Multi-platform Support**: Android, iOS, Web, Linux, macOS, and Windows
- **Firebase Integration**: Analytics, Messaging, Firestore, and Authentication
- **Multiple Environments**: Development, Staging, and Production configurations
- **Clean Architecture**: Features-based structure with clear separation of concerns
- **Modern State Management**: BLoC pattern with flutter_bloc
- **Type-safe Networking**: Retrofit with Dio for API calls
- **Dependency Injection**: Injectable for IoC container management
- **Routing**: Auto Route for type-safe navigation
- **Localization**: Multi-language support with L10n
- **Code Generation**: Freezed for immutable models and JSON serialization

## Project Structure

```
lib/
├── main.dart                 # Development entry point
├── main_dev.dart            # Dev environment entry
├── main_stag.dart           # Staging environment entry
├── main_prod.dart           # Production environment entry
├── main_app.dart            # App initialization and setup
├── core/                    # Core functionality
│   ├── app_theme/          # Theming and styling
│   ├── clients/            # API and service clients
│   ├── config/             # Configuration files
│   ├── injection/          # Dependency injection setup
│   ├── routes/             # Navigation routes
│   ├── services/           # Application services
│   ├── utils/              # Utility functions
│   └── widgets/            # Reusable widgets
├── features/               # Feature modules (Clean Architecture)
│   ├── auth/              # Authentication feature
│   ├── dashboard/         # Dashboard feature
│   ├── splash/            # Splash screen
│   └── term_conditions/   # Terms & Conditions
└── l10n/                  # Localization files

assets/
├── fonts/                 # Custom fonts
├── images/                # Image assets
└── svgs/                  # SVG assets
```

## Getting Started

### Prerequisites

- Flutter SDK: `^3.10.1`
- Dart SDK: `^3.10.1`
- iOS: Xcode 12.0+
- Android: Android Studio & Android SDK
- Firebase CLI (for Firebase configuration)

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd flutter_template
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code**

   ```bash
   # Generate Freezed models, JSON serialization, routes, and localization
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Configure Firebase** (if not already done)

   ```bash
   # Install Firebase CLI if not already installed
   curl -sL https://firebase.tools | bash

   # Login to Firebase
   firebase login

   # Initialize Firebase for the project
   flutterfire configure
   ```

## Running the App

**Note:** Running the app requires environment variables to be passed via `--dart-define-from-file`. Ensure `.env` files are converted to JSON format using the `env_to_json.dart` script first.

### Development Environment

```bash
# iOS
flutter run -t lib/main_dev.dart --dart-define-from-file=.dart_defines/.dev.env.json
flutter run -t lib/main_dev.dart -d "iPhone 14 Pro" --dart-define-from-file=.dart_defines/.dev.env.json

# Android
flutter run -t lib/main_dev.dart --dart-define-from-file=.dart_defines/.dev.env.json

# Web
flutter run -t lib/main_dev.dart -d chrome --dart-define-from-file=.dart_defines/.dev.env.json

# macOS
flutter run -t lib/main_dev.dart -d macos --dart-define-from-file=.dart_defines/.dev.env.json

# Windows
flutter run -t lib/main_dev.dart -d windows --dart-define-from-file=.dart_defines/.dev.env.json

# Linux
flutter run -t lib/main_dev.dart -d linux --dart-define-from-file=.dart_defines/.dev.env.json
```

### Staging Environment

```bash
flutter run -t lib/main_stag.dart --dart-define-from-file=.dart_defines/.stag.env.json
```

### Production Environment

```bash
flutter run -t lib/main_prod.dart --dart-define-from-file=.dart_defines/.prod.env.json
```

### VS Code Launch Configurations

This project includes pre-configured VS Code debug launches in `.vscode/launch.json` for all environments and modes:

**Available Configurations:**

- `app-flutter-dev-debug` - Development environment, debug mode
- `app-flutter-dev-release` - Development environment, release mode
- `app-flutter-stag-debug` - Staging environment, debug mode
- `app-flutter-stag-release` - Staging environment, release mode
- `app-flutter-prod-debug` - Production environment, debug mode
- `app-flutter-prod-release` - Production environment, release mode

**To run from VS Code:**

1. Open the Run and Debug panel (Ctrl+Shift+D / Cmd+Shift+D)
2. Select a configuration from the dropdown
3. Click the green play button or press F5

Each configuration automatically:

- Targets the correct entry point (`main_dev.dart`, `main_stag.dart`, or `main_prod.dart`)
- Applies the appropriate flavor flag
- Loads environment variables from the corresponding JSON file

## Building for Release

**Note:** Build commands require environment variables to be passed via `--dart-define-from-file`. Ensure `.env` files are converted to JSON format using the `env_to_json.dart` script before building.

### iOS

```bash
# Development
flutter build ipa -t lib/main_dev.dart --dart-define-from-file=.dart_defines/.dev.env.json

# Staging
flutter build ipa -t lib/main_stag.dart --dart-define-from-file=.dart_defines/.stag.env.json

# Production
flutter build ipa -t lib/main_prod.dart --dart-define-from-file=.dart_defines/.prod.env.json
```

### Android

```bash
# Development
flutter build apk -t lib/main_dev.dart --dart-define-from-file=.dart_defines/.dev.env.json

# Staging
flutter build apk -t lib/main_stag.dart --dart-define-from-file=.dart_defines/.stag.env.json

# Production
flutter build aab -t lib/main_prod.dart --dart-define-from-file=.dart_defines/.prod.env.json
```

### Web

```bash
# Development
flutter build web -t lib/main_dev.dart --dart-define-from-file=.dart_defines/.dev.env.json

# Staging
flutter build web -t lib/main_stag.dart --dart-define-from-file=.dart_defines/.stag.env.json

# Production
flutter build web -t lib/main_prod.dart --dart-define-from-file=.dart_defines/.prod.env.json
```

## Code Generation

This project uses `build_runner` to generate code. Run the following command after making changes to:

- Routes (`lib/core/routes/app_routes.dart`)
- Models with `@freezed` annotation
- Dependency injection classes
- Localization files

```bash
dart run build_runner build --delete-conflicting-outputs

# Or watch mode for development
dart run build_runner watch --delete-conflicting-outputs
```

## Environment Configuration

Each environment (`dev`, `stag`, `prod`) has its own:

- Firebase configuration
- API base URLs
- Feature flags
- Logging levels

Configure in `lib/core/config/` and modify injection setup in `lib/core/injection/`.

### Environment Variables Setup

This project uses `.env` files to manage environment-specific variables. The `scripts/env_to_json.dart` script converts `.env` files to JSON format for Flutter's `--dart-define-from-file` flag.

**Setup Steps:**

1. **Create environment files in project root:**

   ```bash
   .dev.env
   .stag.env
   .prod.env
   ```

2. **Add your environment variables** (example `.dev.env`):

   ```
   # API Configuration
   API_BASE_URL=https://dev-api.example.com
   API_TIMEOUT=30

   # Feature Flags
   ENABLE_ANALYTICS=true
   DEBUG_MODE=true

   # Firebase Config
   FIREBASE_PROJECT_ID=flutter-template-86e8e
   ```

3. **Convert .env files to JSON format:**

   ```bash
   # Convert development environment
   dart scripts/env_to_json.dart .dev.env .dart_defines/.dev.env.json

   # Convert staging environment
   dart scripts/env_to_json.dart .stag.env .dart_defines/.stag.env.json

   # Convert production environment
   dart scripts/env_to_json.dart .prod.env .dart_defines/.prod.env.json
   ```

4. **Or use a setup script** (optional):
   ```bash
   # Create this script to automate conversion
   #!/bin/bash
   dart scripts/env_to_json.dart .dev.env .dart_defines/.dev.env.json
   dart scripts/env_to_json.dart .stag.env .dart_defines/.stag.env.json
   dart scripts/env_to_json.dart .prod.env .dart_defines/.prod.env.json
   ```

**The `env_to_json.dart` script:**

- Parses `.env` files in `KEY=VALUE` format
- Skips empty lines and comments (lines starting with `#`)
- Removes surrounding quotes from values
- Creates `.dart_defines/` directory if it doesn't exist
- Generates JSON files that Flutter can consume

## Localization

Add new translations in `lib/l10n/` following the ARB (Application Resource Bundle) format:

- `app_en.arb` - English
- `app_es.arb` - Spanish (example)

Run code generation to generate localization classes:

```bash
dart run build_runner build
```

Access translations in widgets:

```dart
Text(AppLocalizations.of(context)!.helloWorld)
```

## Firebase Setup

This template includes Firebase integration. Ensure Firebase is configured:

1. **Android**: `android/app/google-services.json` (auto-generated by flutterfire)
2. **iOS**: `ios/Runner/GoogleService-Info.plist` (auto-generated by flutterfire)
3. **Web**: Add Firebase config to `web/index.html`

Features available:

- Firebase Analytics
- Firebase Messaging (Push notifications)
- Firebase Firestore (Database)
- Firebase Authentication

## Testing

```bash
# Run unit and widget tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## Code Quality

```bash
# Analyze code
flutter analyze

# Format code
dart format lib/

# Run linter
dart analyze
```

## Contributing

1. Create a feature branch: `git checkout -b feature/my-feature`
2. Commit changes: `git commit -m 'Add my feature'`
3. Push to branch: `git push origin feature/my-feature`
4. Open a Pull Request

## Troubleshooting

### Flutter pub get fails

```bash
flutter clean
flutter pub get
```

### Code generation not working

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Pod install fails (iOS)

```bash
cd ios
rm -rf Pods
rm Podfile.lock
cd ..
flutter pub get
```

### Hot reload issues

Use `flutter run` without `-t` flag for debug mode, or restart the app.

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Clean Architecture in Flutter](https://resocoder.com/clean-architecture-tdd)
- [BLoC Pattern](https://bloclibrary.dev/)

## License

This project is licensed under the MIT License - see LICENSE file for details.

## Support

For issues, questions, or suggestions, please open an issue on the repository.

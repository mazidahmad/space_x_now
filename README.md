# 🚀 SpaceX Now

A modern Flutter application for tracking SpaceX launches, rockets, and missions in real-time. Built with a clean architecture and monorepo structure using Melos for efficient package management.

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.24.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.6.1+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

</div>

## 📱 About

SpaceX Now is a comprehensive mobile application that provides real-time information about SpaceX missions, launches, rockets, and spacecraft. The app features a beautiful space-themed UI inspired by space exploration and astronaut aesthetics.

### ✨ Key Features

- **🚀 Live Launch Tracking**: Real-time updates on upcoming and past SpaceX launches
- **🛰️ Mission Details**: Comprehensive information about SpaceX missions
- **🚀 Rocket Database**: Detailed specifications and history of SpaceX rockets
- **🌍 Launch Pad Information**: Complete details about SpaceX launch facilities
- **📦 Payload Tracking**: Information about satellite deployments and cargo missions
- **⭐ Favorites System**: Save and track your favorite missions and rockets
- **🌙 Dark/Light Theme**: Space-themed UI with both light and dark modes
- **📱 Cross-Platform**: Available for iOS and Android

## 🏗️ Architecture

This project follows a **monorepo architecture** using Melos for package management and implements **Clean Architecture** principles with clear separation of concerns.

### 📁 Project Structure

```
space_x_now/
├── apps/
│   └── space_x_now_app/          # Main Flutter application
├── packages/
│   ├── core/                     # Core shared functionality
│   ├── ui_components/            # Shared UI components & themes
│   ├── launches/                 # Launches feature package
│   ├── rockets/                  # Rockets feature package
│   ├── launchpad/               # Launch pad feature package
│   ├── payload/                 # Payload feature package
│   └── di/                      # Dependency injection
└── pubspec.yaml                 # Workspace configuration
```

### 🔧 Tech Stack

- **Framework**: Flutter 3.24.0+
- **Language**: Dart 3.6.1+
- **Monorepo Management**: Melos 7.1.0+
- **State Management**: Flutter Bloc
- **Networking**: Dio with custom interceptors
- **Dependency Injection**: GetIt + Injectable
- **Code Generation**: Build Runner + Freezed + Json Annotation
- **UI Components**: Material Design 3 with custom space theme
- **Storage**: Shared Preferences, Cached Storage
- **Connectivity**: Connectivity Plus for network monitoring

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.24.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (3.6.1 or higher)
- [Git](https://git-scm.com/)
- [Melos](https://melos.invertase.dev/) for monorepo management

### 📥 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mazidahmad/space_x_now.git
   cd space_x_now
   ```

2. **Install Melos globally** (if not already installed)
   ```bash
   dart pub global activate melos
   ```

3. **Bootstrap the workspace**
   ```bash
   melos bootstrap
   ```
   This command will:
   - Install dependencies for all packages
   - Link local packages together
   - Generate necessary files

4. **Generate code for all packages**
   ```bash
   melos build_app
   ```

5. **Run the application**
   ```bash
   cd apps/space_x_now_app
   flutter run
   ```

### 🔧 Development Setup

#### Available Melos Scripts

The project includes several Melos scripts for efficient development:

```bash
# Code analysis
melos analyze                    # Analyze all packages
melos format                     # Format all Dart files

# Build commands
melos build_app                  # Build the main app
melos build_core_package         # Build core package
melos build_launches_package     # Build launches package
melos build_rockets_package      # Build rockets package
melos build_launchpad_package    # Build launchpad package
melos build_payload_package      # Build payload package

# Clean builds
melos build_app:clean           # Clean and rebuild app
melos build_core_package:clean  # Clean and rebuild core
```

#### Running Specific Packages

```bash
# Navigate to specific package
cd packages/launches
flutter pub get
flutter test

# Or use Melos exec
melos exec --scope=space_x_launches -- flutter test
```

## 🎨 UI/UX Design

The application features a **space-themed design system** inspired by space exploration:

### 🎨 Color Palette

- **Space Deep Blue** (#0A0E27) - Primary background
- **Rocket Orange** (#FF6B35) - SpaceX signature color
- **Thruster Blue** (#00A8FF) - Engine flame blue
- **Metallic Grays** - Astronaut suit inspired colors
- **Success Green** (#48BB78) - Mission success
- **Warning Yellow** (#ED8936) - Caution systems
- **Error Red** (#E53E3E) - Critical alerts

### 🔤 Typography

- **Primary Font**: D-DIN (Space-themed font family)
- **Material Design 3** integration
- **Responsive text scaling**

## 📚 Package Details

### 🔧 Core Package (`packages/core/`)
- **Purpose**: Shared business logic and infrastructure
- **Features**: Networking, storage, error handling, dependency injection
- **Dependencies**: Dio, GetIt, Injectable, Flutter Bloc

### 🎨 UI Components (`packages/ui_components/`)
- **Purpose**: Shared UI elements and theming
- **Features**: Material Design 3 themes, custom widgets, space color palette
- **Dependencies**: Google Fonts, Cached Network Image, Iconsax Flutter

### 🚀 Feature Packages
- **Launches** (`packages/launches/`): Launch tracking and mission details
- **Rockets** (`packages/rockets/`): Rocket specifications and history
- **Launchpad** (`packages/launchpad/`): Launch facility information
- **Payload** (`packages/payload/`): Satellite and cargo mission data

## 🧪 Testing

Run tests for all packages:

```bash
# Run all tests
melos test

# Run tests for specific package
cd packages/core
flutter test

# Run tests with coverage
flutter test --coverage
```

## 🚀 Building for Production

### Android
```bash
cd apps/space_x_now_app
flutter build apk --release
```

### iOS
```bash
cd apps/space_x_now_app
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow the established architecture patterns
- Write tests for new features
- Use conventional commit messages
- Ensure code formatting with `melos format`
- Run analysis with `melos analyze` before committing

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [SpaceX API](https://github.com/r-spacex/SpaceX-API) for providing the data
- [Flutter](https://flutter.dev/) for the amazing framework
- [Melos](https://melos.invertase.dev/) for monorepo management
- Space exploration imagery and design inspiration

## 📞 Contact

**Mazi Ahmad** - [@mazidahmad](https://github.com/mazidahmad)

Project Link: [https://github.com/mazidahmad/space_x_now](https://github.com/mazidahmad/space_x_now)

---

<div align="center">
Made with ❤️ and 🚀 by the SpaceX Now team
</div>

# Project Structure

This document outlines the organization of the Flutter project's lib directory.

## Directory Structure

```
lib/
├── core/                     # Core functionality and utilities
│   ├── constants/            # App-wide constants
│   ├── services/             # Global services (API, storage, etc.)
│   └── utils/                # Utility functions and helpers
├── features/                 # Feature-based modules
│   ├── auth/                 # Authentication feature
│   ├── pet_management/       # Pet management feature
│   ├── appointments/         # Appointments feature
│   ├── chat/                # Chat feature
│   ├── maps/                # Maps feature
│   └── settings/            # Settings feature
├── models/                   # Data models
├── shared/                   # Shared components
│   ├── widgets/             # Reusable widgets
│   └── theme/               # Theme configuration
└── main.dart                # App entry point
```

## Guidelines

1. **Feature-First Organization**: Each feature should be self-contained with its own screens, widgets, and services.

2. **Shared Components**: Common widgets and utilities should be placed in the shared directory.

3. **Core Functionality**: App-wide services and utilities belong in the core directory.

4. **Models**: Data models should be placed in the models directory and can be imported by features as needed.

5. **Theme**: All theme-related configurations should be in shared/theme.

This structure promotes:
- Better code organization
- Easier navigation
- Clear separation of concerns
- Improved maintainability
- Scalability for future features
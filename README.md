# Flutter Calculator App

A simple calculator app built with Flutter that follows the MVC (Model-View-Controller) pattern. 



## Features

- Basic math operations (+, -, ×, ÷)
- Shows full equation on screen (e.g., "6 - 3 = 3")
- Distance converter (kilometers ↔ miles)
- Clean dark theme UI



## File Structure

```
lib/
├── main.dart
├── models/
│   ├── calculator_model.dart
│   └── converter_model.dart
├── controllers/
│   ├── calculator_controller.dart
│   └── converter_controller.dart
└── views/
    ├── calculator_screen.dart
    └── converter_screen.dart
```

## Architecture

This app follows the **MVC pattern**:

- **Models**: Handle math calculations and data
- **Controllers**: Manage button logic and user interactions
- **Views**: Display UI and handle user input

## How to Run

1. Clone this repository
2. Make sure you have Flutter installed
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app
!!To avoid version problems check the app in Chrome( flutter run , 2 )

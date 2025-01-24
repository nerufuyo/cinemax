# CINEMAX

Cinemax is a Flutter application that allows users to browse and search for movies. The app provides information about popular, upcoming, now playing, and top-rated movies. Users can also view detailed information about each movie, including trailers and reviews.

## Features

- Browse popular, upcoming, now playing, and top-rated movies
- Search for movies by keyword
- View detailed information about each movie
- Watch movie trailers
- Read movie reviews

## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An IDE with Flutter support (e.g., [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/cinemax.git
   cd cinemax
   ```

2. Install dependencies:
   ```sh
   flutter pub get
   ```

3. Run the app:
   ```sh
   flutter run
   ```

## Project Structure

```plaintext
lib/
├── main.dart
├── models/
│   ├── movie_entity.dart
│   └── movie_result_entity.dart
├── repositories/
│   ├── movie_repository.dart
│   └── movie_remote_data.dart
├── controllers/
│   └── home_controller.dart
├── screens/
│   ├── home_screen.dart
│   └── detail_screen.dart
└── widgets/
    ├── movie_card_widget.dart
    └── video_player_widget.dart
```

## Usage

1. Open the app on your device or emulator.
2. Browse through the different categories of movies.
3. Use the search bar to find specific movies.
4. Tap on a movie to view detailed information, watch trailers, and read reviews.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/your-feature-name`).
6. Open a pull request.


## Screenshot
<img alt="Cinemax Screenshot" src="https://res.cloudinary.com/dxcpx9pxn/image/upload/v1737719879/CINEMAX_flufo3.jpg">


## Video
<video width="320" height="240" controls> <source src="https://res.cloudinary.com/dxcpx9pxn/video/upload/v1737719946/Screen_Recording_2025-01-24_at_17.31.21_hkevz1.mov" type="video/mp4"> Your browser does not support the video tag. </video> 
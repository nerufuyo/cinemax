import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstant {
  static const String appName = 'CinemaX';
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String apiKey = dotenv.env['API_READ_ACCESS_TOKEN']!;
  static String defaultTeaser =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';
}

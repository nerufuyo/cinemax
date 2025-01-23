import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppContant {
  static const String appName = 'CinemaX';
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String apiKey = dotenv.env['API_READ_ACCESS_TOKEN']!;
}

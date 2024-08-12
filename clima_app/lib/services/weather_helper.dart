import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherHelper {
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$baseUrl?q=$cityName&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();
    double? latitude = location.latitude;
    double? longitude = location.longitude;

    NetworkHelper networkHelper =
        NetworkHelper('$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getIcon(int condition) {
    if (condition < 300) {
      return '️⛈️';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '❄️';
    } else if (condition < 800) {
      return '🌫️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition == 801) {
      return '🌤️';
    } else if (condition == 802) {
      return '⛅️️';
    } else if (condition == 803) {
      return '🌥️';
    } else if (condition == 804) {
      return '☁️';
    }
    return '🤷‍♂️';
  }

  String getText(int temperature) {
    if (temperature < 0) {
      return 'Freezing! Stay warm and bundle up!';
    } else if (temperature >= 0 && temperature < 10) {
      return 'Chilly outside. Don\'t forget your jacket!';
    } else if (temperature >= 10 && temperature < 20) {
      return 'Cool and comfy. A light jacket will do.';
    } else if (temperature >= 20 && temperature < 25) {
      return 'Mild weather. Enjoy the day!';
    } else if (temperature >= 25 && temperature < 30) {
      return 'Warm and sunny. Stay hydrated!';
    } else if (temperature >= 30 && temperature < 35) {
      return 'Hot! Wear light clothes and drink water.';
    } else if (temperature >= 35) {
      return 'Scorching heat! Stay cool and avoid the sun.';
    } else {
      return 'We don\'t know. Temperature is unknown.';
    }
  }
}

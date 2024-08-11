import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    final String apiKey = dotenv.env['API_KEY'] ?? '';
    Location location = Location();

    await location.getCurrentLocation();
    double? latitude = location.latitude;
    double? longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            LoadingAnimationWidget.stretchedDots(color: Colors.white, size: 50),
      ),
    );
  }
}

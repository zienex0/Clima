import 'package:clima_app/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:clima_app/services/weather_helper.dart';
import 'package:permission_handler/permission_handler.dart';

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
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
    }

    if (status.isGranted) {
      WeatherHelper weatherHelper = WeatherHelper();
      dynamic weatherData = await weatherHelper.getLocationWeather();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }));
    } else {
      print('Location permission denied');
    }
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

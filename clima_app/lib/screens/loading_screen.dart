import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/utilities/constants.dart';
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
    if (status.isGranted) {
      // Permission is granted, proceed with getting weather data
      WeatherHelper weatherHelper = WeatherHelper();
      dynamic weatherData = await weatherHelper.getLocationWeather();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }));
    } else if (status.isDenied) {
      status = await Permission.location.request();
      if (status.isGranted) {
        getLocationData();
      } else {
        print('Location permission denied');
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.stretchedDots(color: Colors.white, size: 50),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Fetching location... \nPlease make sure you allowed location permissions.',
                style: kNormalTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

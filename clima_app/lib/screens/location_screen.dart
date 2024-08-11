import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen(this.locationWeather);
  final dynamic locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String city = 'Unknown';
  String weather = 'Unavailable';
  int temperature = 0;
  int condition = 800;

  void updateUI() {
    setState(() {
      var weatherData = widget.locationWeather;

      if (weatherData != null) {
        city = weatherData['name'];
        weather = weatherData['weather'][0]['main'];
        double temp = weatherData['main']['temp'] - 273.15;
        temperature = temp.toInt();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('images/location_background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.6), BlendMode.dstATop),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        '$temperature°C',
                        style: const TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          '🌥️',
                          style: TextStyle(
                            fontSize: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    city ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

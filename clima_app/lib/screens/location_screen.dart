import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/services/weather_helper.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen(this.locationWeather);
  final dynamic locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String cityName = 'Unknown';
  int temperature = 0;
  int condition = 0;
  WeatherHelper weatherHelper = WeatherHelper();
  String weatherIcon = '🤷‍♂️';
  String weatherText =
      'We would help you but we couldn\'t get the weather data';

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData != null) {
        cityName = weatherData['name'];

        double temp = weatherData['main']['temp'] - 273.15;
        temperature = temp.toInt();

        condition = weatherData['weather'][0]['id'];

        weatherIcon = weatherHelper.getIcon(condition);
        weatherText = weatherHelper.getText(temperature);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('images/waterfall.png'),
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
                const SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      // DISPLAYING CURRENT TEMPERATURE
                      Text('$temperature°', style: kHugeTextStyle),
                      // GETTING THE ICON FOR THE WEATHER
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(weatherIcon, style: kHugeTextStyle),
                      ),
                    ],
                  ),
                ),
                // DISPLAYING THE CURRENT LOCATION CITY
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(cityName, style: kNormalTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 100, 0),
                  child: Text(weatherText, style: kLightTextStyle),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () async {
                          var typedCityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CityScreen(),
                            ),
                          );
                          if (typedCityName != null) {
                            var weatherData = await weatherHelper
                                .getCityWeather(typedCityName);
                            updateUI(weatherData);
                          }
                        },
                        child: const Icon(
                          Icons.near_me_rounded,
                          color: Colors.white,
                          size: kBigIconSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () async {
                          var weather =
                              await weatherHelper.getLocationWeather();
                          updateUI(weather);
                        },
                        child: const Icon(
                          Icons.my_location_rounded,
                          color: Colors.white,
                          size: kBigIconSize,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

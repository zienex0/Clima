import 'package:clima_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/city_roads_background.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.4), BlendMode.dstATop),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: kBigIconSize,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  style: kDarkNormalButtonStyle,
                  child: const Text(
                    'Get Weather',
                    style: kNormalTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

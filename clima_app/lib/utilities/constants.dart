import 'package:flutter/material.dart';

// Base size for scaling
const double kBaseSize = 10.0;

// Text Styles
const TextStyle kHugeTextStyle = TextStyle(
  fontSize: kBaseSize * 10, // Scaled from base size
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const TextStyle kBigTextStyle = TextStyle(
  fontSize: kBaseSize * 5, // Scaled from base size
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const TextStyle kNormalTextStyle = TextStyle(
  fontSize: kBaseSize * 2, // Scaled from base size
  color: Colors.white,
  fontWeight: FontWeight.normal,
);

const TextStyle kLightTextStyle = TextStyle(
  fontSize: kBaseSize * 2, // Scaled from base size
  color: Colors.white,
  fontWeight: FontWeight.w200,
);

// Icon Sizes
const double kBigIconSize = kBaseSize * 5;

// Input Decoration
const InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Color(
      0xAA1E1E1E), // Dark color with some transparency (0xAA represents the transparency)
  icon: Icon(
    Icons.location_city_rounded,
    color: Colors.white,
    size: kBigIconSize, // Use the scaled icon size
  ),
  hintText: 'Enter city name',
  hintStyle: TextStyle(
      color: Color(0xFFBDBDBD)), // Light grey color close to grey[400]
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
);

ButtonStyle kDarkNormalButtonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(
      horizontal: 40, vertical: 20), // Increase padding
  minimumSize: const Size(200, 60), // Set minimum size
);

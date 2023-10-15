import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/weather_humidity_levels.dart';
import 'package:weather_app/weather_items_forecast.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hujan Tak Besok ?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.black87,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            '32C',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Rain',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForeCastItem(),
                  HourlyForeCastItem(),
                  HourlyForeCastItem(),
                  HourlyForeCastItem(),
                  HourlyForeCastItem(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HumidityLevels(),
                SizedBox(width: 50),
                HumidityLevels(),
                SizedBox(width: 50),
                HumidityLevels(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/secrets.dart';
import 'package:weather_app/weather_humidity_levels.dart';
import 'package:weather_app/weather_items_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temperature = 0;
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    String cityName = 'Kuala Lumpur';
    try {
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey'),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'Api RoSak Doe';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

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
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            );
          }

          //calling the data from snapshot
          final data = snapshot.data!;

          // This is just another way of concatenating the current params.
          final currentWeatherData = data['list'][0];
          final temperature = currentWeatherData['main']['temp'] - 273.15;
          final pressureLevels = currentWeatherData['main']['pressure'];
          final currentHumdity = currentWeatherData['main']['humidity'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final rainChances = currentWeatherData['rain']['3h'];
          final cnt = data['cnt'];

          // print(currentSky);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  '${temperature.toStringAsFixed(2)} °C',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Sunny'
                                    ? Icons.cloud
                                    : Icons.sunny_snowing,
                                size: 64,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                currentSky,
                                style: const TextStyle(fontSize: 20),
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
                  'Hourly Forecast',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 1; i < cnt; i++)
                        HourlyForeCastItem(
                          icon: data['list'][i]['weather'][0]['main'] ==
                                      'Clouds' ||
                                  data['list'][i]['weather'][0]['main'] ==
                                      'Sunny'
                              ? Icons.cloud
                              : Icons.sunny_snowing,
                          time: data['list'][i]['dt_txt'].substring(10, 16) +
                              ' / ' +
                              data['list'][i]['dt_txt'].substring(5, 10),
                          temperature:
                              (data['list'][i]['main']['temp'] - 273.15)
                                      .toStringAsFixed(0) +
                                  ' °C',
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HumidityLevels(
                      value: '$currentHumdity %',
                      icon: Icons.cloud,
                      label: 'Humidity',
                    ),
                    const SizedBox(width: 50),
                    HumidityLevels(
                      value: '$rainChances',
                      icon: Icons.water_drop_outlined,
                      label: 'Rainmeter',
                    ),
                    const SizedBox(width: 50),
                    HumidityLevels(
                      value: '$pressureLevels PSI',
                      icon: Icons.wind_power,
                      label: 'Pressure',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HumidityLevels extends StatelessWidget {
  const HumidityLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.water_drop,
          size: 30,
        ),
        SizedBox(height: 5),
        Text(
          'Humidity',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 2),
        Text(
          '100 %',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

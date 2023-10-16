import 'package:flutter/material.dart';

class HourlyForeCastItem extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temperature;

  const HourlyForeCastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 10,
        child: Container(
          width: 100,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                // overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 10),
              Icon(
                icon,
                size: 32,
              ),
              const SizedBox(height: 15),
              Text(
                temperature,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

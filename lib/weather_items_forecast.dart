import 'package:flutter/material.dart';

class HourlyForeCastItem extends StatelessWidget {
  const HourlyForeCastItem({super.key});

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
          child: const Column(
            children: [
              Text(
                'Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Icon(
                Icons.cloud,
                size: 32,
              ),
              SizedBox(height: 8),
              Text(
                '30 C',
                style: TextStyle(
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

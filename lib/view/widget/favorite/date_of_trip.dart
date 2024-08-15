import 'package:flutter/material.dart';

class DateOfTrip extends StatelessWidget {
  final String startDate;
  final String endDate;
  const DateOfTrip({super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          width: 80,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 89, 213, 93),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: Text(
            startDate,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        const Icon(Icons.arrow_right),
        const SizedBox(
          width: 3,
        ),
        Container(
          padding: const EdgeInsets.all(2),
          width: 80,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 89, 213, 93),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: Text(
            endDate,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

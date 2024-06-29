import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});


  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentDate = '${now.day}, ${_getMonthName(now.month)} ${now.year}';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                'Jakarta, Indonesia',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Switch(
            value: true,
            onChanged: (value) {},
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const List<String> monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }
}

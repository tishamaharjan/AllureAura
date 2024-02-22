import 'package:flutter/material.dart';
import 'buttommenu.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFFE5D4FF),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your other widgets and content here

                Text(
                  'Appointment History',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7743DB),
                  ),
                ),

                SizedBox(height: 20.0),

                // Add more widgets as needed
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenu(activeIndex: 1),
      ),
    );
  }
}

import 'package:allureaura/BookBtn/calendar.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Urgent extends StatefulWidget {
  final String choosedServiceType;
  final String choosedServicePrice;
  final String service;

  const Urgent({
    required this.choosedServiceType,
    required this.choosedServicePrice,
    required this.service,
    Key? key,
  }) : super(key: key);

  @override
  State<Urgent> createState() => _UrgentState();
}

class _UrgentState extends State<Urgent> {
  String UrgentBook = "UrgentBook";
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
            padding: EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 150.0),
                  Text(
                    'Urgent Booking',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7743DB),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          UrgentBook = 'Yes';
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Date()));
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Color(0xFF7743DB), // Text color of the button
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          UrgentBook = 'No';
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Date()));
                      },
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Color(0xFF7743DB), // Text color of the button
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        bottomNavigationBar: BottomMenu(activeIndex: 0),
      ),
    );
  }
}

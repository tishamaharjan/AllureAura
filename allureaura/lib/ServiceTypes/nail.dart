import 'package:allureaura/BookBtn/book.dart';
import 'package:allureaura/appointmentDetails.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Nail extends StatefulWidget {
  final Appointment appointment;
  const Nail({required this.appointment, Key? key}) : super(key: key);

  @override
  State<Nail> createState() => _NailState();
}

class _NailState extends State<Nail> {
  late String Username;
  late String ChosenService;
  String ChosenServiceType = 'ChoosedServiceType';
  int ChosenServicePrice = 0;

  @override
  void initState() {
    super.initState();

    Username = widget.appointment.username;
    ChosenService = widget.appointment.chosenService;
  }

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
                  SizedBox(height: 50.0),
                  Text(
                    'NAIL ART AND EXTENSIONS',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7743DB),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Color(0xFFD0A2F7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gel Nail Extension\nPrice: 50000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ChosenServiceType = 'GelNailExtension';
                                    ChosenServicePrice = 50000;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Book(
                                                appointment: Appointment(
                                                    username: Username,
                                                    chosenService:
                                                        ChosenService,
                                                    chosenServiceType:
                                                        ChosenServiceType,
                                                    chosenServicePrice:
                                                        ChosenServicePrice),
                                              )));
                                },
                                child: Text(
                                  'Book',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Color(0xFFD0A2F7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Normal Nail Extension\nPrice: 2000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ChosenServiceType = 'NormalNailExtension';
                                    ChosenServicePrice = 2000;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Book(
                                                appointment: Appointment(
                                                    username: Username,
                                                    chosenService:
                                                        ChosenService,
                                                    chosenServiceType:
                                                        ChosenServiceType,
                                                    chosenServicePrice:
                                                        ChosenServicePrice),
                                              )));
                                },
                                child: Text(
                                  'Book',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Color(0xFFD0A2F7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nail Art\nPrice: 1000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ChosenServiceType = 'NailArt';
                                    ChosenServicePrice = 1000;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Book(
                                                appointment: Appointment(
                                                    username: Username,
                                                    chosenService:
                                                        ChosenService,
                                                    chosenServiceType:
                                                        ChosenServiceType,
                                                    chosenServicePrice:
                                                        ChosenServicePrice),
                                              )));
                                },
                                child: Text(
                                  'Book',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        bottomNavigationBar: BottomMenu(
          activeIndex: 0,
          token: '',
          username: Username,
        ),
      ),
    );
  }
}

import 'package:allureaura/BookBtn/urgent.dart';
import 'package:allureaura/appointmentDetails.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Book extends StatefulWidget {
  final Appointment appointment;
  const Book({required this.appointment, Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  late String Username;
  late String ChosenService;
  late String ChosenServiceType;
  late int ChosenServicePrice;
  String Service = 'Service';
  int HomeServicePrice = 0;

  @override
  void initState() {
    super.initState();

    Username = widget.appointment.username;
    ChosenService = widget.appointment.chosenService;
    ChosenServiceType = widget.appointment.chosenServiceType ?? '';
    ChosenServicePrice = widget.appointment.chosenServicePrice ?? 0;
  }

  Widget build(BuildContext context) {
    print('Book username: ${widget.appointment.username}');
    print('Book Chosen ServiceType: ${widget.appointment.chosenServiceType}');
    print('choosedServicePrice: ${widget.appointment.chosenServicePrice}');
    print('choosedService: ${widget.appointment.chosenService}');
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
                    'Booking',
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
                          Service = 'HomeService';
                          HomeServicePrice = 500;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Urgent(
                                      appointment: Appointment(
                                          username: Username,
                                          chosenService: ChosenService,
                                          chosenServiceType: ChosenServiceType,
                                          chosenServicePrice:
                                              ChosenServicePrice,
                                          service: Service,
                                          homeServicePrice: HomeServicePrice),
                                    )));
                      },
                      child: Text(
                        'Home Service',
                        style: TextStyle(
                          color: Color(0xFF7743DB),
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
                          Service = 'InParlour';
                          HomeServicePrice = 0;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Urgent(
                                      appointment: Appointment(
                                          username: Username,
                                          chosenService: ChosenService,
                                          chosenServiceType: ChosenServiceType,
                                          chosenServicePrice:
                                              ChosenServicePrice,
                                          service: Service,
                                          homeServicePrice: HomeServicePrice),
                                    )));
                      },
                      child: Text(
                        'In Parlour',
                        style: TextStyle(
                          color: Color(0xFF7743DB),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

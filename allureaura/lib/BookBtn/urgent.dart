import 'package:allureaura/BookBtn/calendar.dart';
import 'package:allureaura/appointmentDetails.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Urgent extends StatefulWidget {
  final Appointment appointment;
  const Urgent({required this.appointment, Key? key}) : super(key: key);

  @override
  State<Urgent> createState() => _UrgentState();
}

class _UrgentState extends State<Urgent> {
  late String Username;
  late String ChosenService;
  late String ChosenServiceType;
  late int ChosenServicePrice;
  late String Service;
  late int HomeServicePrice;
  String UrgentBook = "UrgentBook";
  int UrgentBookPrice = 0;

  @override
  void initState() {
    super.initState();

    Username = widget.appointment.username;
    ChosenService = widget.appointment.chosenService;
    ChosenServiceType = widget.appointment.chosenServiceType ?? '';
    ChosenServicePrice = widget.appointment.chosenServicePrice ?? 0;
    Service = widget.appointment.service ?? '';
    HomeServicePrice = widget.appointment.homeServicePrice ?? 0;
  }

  Widget build(BuildContext context) {
    print('Urgent Chosen ServiceType: ${widget.appointment.chosenServiceType}');
    print('Chosen ServicePrice: ${widget.appointment.chosenServicePrice}');
    print('Chosen Service: ${widget.appointment.chosenService}');
    print('Service: ${widget.appointment.service}');
    print('Home Service Price: ${widget.appointment.homeServicePrice}');
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
                          UrgentBookPrice = 500;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Date(
                                      appointment: Appointment(
                                          username: Username,
                                          chosenService: ChosenService,
                                          chosenServiceType: ChosenServiceType,
                                          chosenServicePrice:
                                              ChosenServicePrice,
                                          service: Service,
                                          homeServicePrice: HomeServicePrice,
                                          urgentBook: UrgentBook,
                                          urgentBookPrice: UrgentBookPrice),
                                    )));
                      },
                      child: Text(
                        'Yes',
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
                          UrgentBook = 'No';
                          UrgentBookPrice = 0;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Date(
                                    appointment: Appointment(
                                        username: Username,
                                        chosenService: ChosenService,
                                        chosenServiceType: ChosenServiceType,
                                        chosenServicePrice: ChosenServicePrice,
                                        service: Service,
                                        homeServicePrice: HomeServicePrice,
                                        urgentBook: UrgentBook,
                                        urgentBookPrice: UrgentBookPrice))));
                      },
                      child: Text(
                        'No',
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

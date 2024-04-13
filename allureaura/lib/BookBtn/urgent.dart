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
  late String ChoosedService;
  late String ChoosedServiceType;
  late int ChoosedServicePrice;
  late String Service;
  late int HomeServicePrice;
  String UrgentBook = "UrgentBook";
  int UrgentBookPrice = 0;

  @override
  void initState() {
    super.initState();
    ChoosedService = widget.appointment.choosedService;
    ChoosedServiceType = widget.appointment.choosedServiceType ?? '';
    ChoosedServicePrice = widget.appointment.choosedServicePrice ?? 0;
    Service = widget.appointment.service ?? '';
    HomeServicePrice = widget.appointment.homeServicePrice ?? 0;
  }

  Widget build(BuildContext context) {
    print(
        'Urgent choosedServiceType: ${widget.appointment.choosedServiceType}');
    print('choosedServicePrice: ${widget.appointment.choosedServicePrice}');
    print('choosedService: ${widget.appointment.choosedService}');
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
                                          choosedService: ChoosedService,
                                          choosedServiceType:
                                              ChoosedServiceType,
                                          choosedServicePrice:
                                              ChoosedServicePrice,
                                          service: Service,
                                          homeServicePrice: HomeServicePrice,
                                          urgentBook: UrgentBook,
                                          urgentBookPrice: UrgentBookPrice),
                                    )));
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
                          UrgentBookPrice = 0;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Date(
                                    appointment: Appointment(
                                        choosedService: ChoosedService,
                                        choosedServiceType: ChoosedServiceType,
                                        choosedServicePrice:
                                            ChoosedServicePrice,
                                        service: Service,
                                        homeServicePrice: HomeServicePrice,
                                        urgentBook: UrgentBook,
                                        urgentBookPrice: UrgentBookPrice))));
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

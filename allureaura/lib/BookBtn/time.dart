import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/invoice.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Time extends StatefulWidget {
  final Appointment appointment;
  const Time({required this.appointment, Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late String ChoosedService;
  late String ChoosedServiceType;
  late int ChoosedServicePrice;
  late String Service;
  late int HomeServicePrice;
  late String UrgentBook;
  late int UrgentBookPrice;
  late DateTime SelectedDate;
  late DateTime CalDate;
  String ChoosedTime = 'Choosed_Time';

  @override
  void initState() {
    super.initState();
    ChoosedService = widget.appointment.choosedService;
    ChoosedServiceType = widget.appointment.choosedServiceType ?? '';
    ChoosedServicePrice = widget.appointment.choosedServicePrice ?? 0;
    Service = widget.appointment.service ?? '';
    HomeServicePrice = widget.appointment.homeServicePrice ?? 0;
    UrgentBook = widget.appointment.urgentBook ?? '';
    UrgentBookPrice = widget.appointment.urgentBookPrice ?? 0;
    SelectedDate = widget.appointment.selectedDate ?? DateTime.now();
    CalDate = widget.appointment.calDate ?? DateTime.now();
  }

  Widget build(BuildContext context) {
    print('Time choosedServiceType: ${widget.appointment.choosedServiceType}');
    print('choosedServicePrice: ${widget.appointment.choosedServicePrice}');
    print('Urgent Book: ${widget.appointment.urgentBook}');
    print('Urgent Book Price: ${widget.appointment.urgentBookPrice}');
    print('choosedService: ${widget.appointment.choosedService}');
    print('Service: ${widget.appointment.service}');
    print('Home Service Price: ${widget.appointment.homeServicePrice}');
    print('Selected Date: ${widget.appointment.selectedDate}');
    print('Calender Date: ${widget.appointment.calDate}');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFFE5D4FF),
            ),
            padding: EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80.0),
                  Text(
                    'Choose the desired time',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7743DB),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ChoosedTime = '10:30 AM - 12:30 PM';
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice(
                                        appointment: Appointment(
                                            choosedService: ChoosedService,
                                            choosedServiceType:
                                                ChoosedServiceType,
                                            choosedServicePrice:
                                                ChoosedServicePrice,
                                            service: Service,
                                            homeServicePrice: HomeServicePrice,
                                            urgentBook: UrgentBook,
                                            urgentBookPrice: UrgentBookPrice,
                                            selectedDate: SelectedDate,
                                            calDate: CalDate,
                                            choosedTime: ChoosedTime),
                                      )));
                        },
                        child: Container(
                          color: Color(0xFFD0A2F7),
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: Center(
                              child: Text(
                            '10:30 AM - 12:30 PM',
                            style: TextStyle(
                                color: Color(0xFF7743DB),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ChoosedTime = '11:30 AM - 1:30 PM';
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice(
                                        appointment: Appointment(
                                            choosedService: ChoosedService,
                                            choosedServiceType:
                                                ChoosedServiceType,
                                            choosedServicePrice:
                                                ChoosedServicePrice,
                                            service: Service,
                                            homeServicePrice: HomeServicePrice,
                                            urgentBook: UrgentBook,
                                            urgentBookPrice: UrgentBookPrice,
                                            selectedDate: SelectedDate,
                                            calDate: CalDate,
                                            choosedTime: ChoosedTime),
                                      )));
                        },
                        child: Container(
                          color: Color(0xFFD0A2F7),
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: Center(
                              child: Text(
                            '11:30 AM - 1:30 PM',
                            style: TextStyle(
                                color: Color(0xFF7743DB),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ChoosedTime = '12:30 AM - 2:30 PM';
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice(
                                        appointment: Appointment(
                                            choosedService: ChoosedService,
                                            choosedServiceType:
                                                ChoosedServiceType,
                                            choosedServicePrice:
                                                ChoosedServicePrice,
                                            service: Service,
                                            homeServicePrice: HomeServicePrice,
                                            urgentBook: UrgentBook,
                                            urgentBookPrice: UrgentBookPrice,
                                            selectedDate: SelectedDate,
                                            calDate: CalDate,
                                            choosedTime: ChoosedTime),
                                      )));
                        },
                        child: Container(
                          color: Color(0xFFD0A2F7),
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: Center(
                              child: Text(
                            '12:30 AM - 2:30 PM',
                            style: TextStyle(
                                color: Color(0xFF7743DB),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ChoosedTime = '1:30 AM - 3:30 PM';
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice(
                                        appointment: Appointment(
                                            choosedService: ChoosedService,
                                            choosedServiceType:
                                                ChoosedServiceType,
                                            choosedServicePrice:
                                                ChoosedServicePrice,
                                            service: Service,
                                            homeServicePrice: HomeServicePrice,
                                            urgentBook: UrgentBook,
                                            urgentBookPrice: UrgentBookPrice,
                                            selectedDate: SelectedDate,
                                            calDate: CalDate,
                                            choosedTime: ChoosedTime),
                                      )));
                        },
                        child: Container(
                          color: Color(0xFFD0A2F7),
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: Center(
                              child: Text(
                            '1:30 AM - 3:30 PM',
                            style: TextStyle(
                                color: Color(0xFF7743DB),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ChoosedTime = '3:00 AM - 5:00 PM';
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice(
                                        appointment: Appointment(
                                            choosedService: ChoosedService,
                                            choosedServiceType:
                                                ChoosedServiceType,
                                            choosedServicePrice:
                                                ChoosedServicePrice,
                                            service: Service,
                                            homeServicePrice: HomeServicePrice,
                                            urgentBook: UrgentBook,
                                            urgentBookPrice: UrgentBookPrice,
                                            selectedDate: SelectedDate,
                                            calDate: CalDate,
                                            choosedTime: ChoosedTime),
                                      )));
                        },
                        child: Container(
                          color: Color(0xFFD0A2F7),
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: Center(
                              child: Text(
                            '3:00 AM - 5:00 PM',
                            style: TextStyle(
                                color: Color(0xFF7743DB),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ChoosedTime = '4:00 AM - 6:00 PM';
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice(
                                        appointment: Appointment(
                                            choosedService: ChoosedService,
                                            choosedServiceType:
                                                ChoosedServiceType,
                                            choosedServicePrice:
                                                ChoosedServicePrice,
                                            service: Service,
                                            homeServicePrice: HomeServicePrice,
                                            urgentBook: UrgentBook,
                                            urgentBookPrice: UrgentBookPrice,
                                            selectedDate: SelectedDate,
                                            calDate: CalDate,
                                            choosedTime: ChoosedTime),
                                      )));
                        },
                        child: Container(
                          color: Color(0xFFD0A2F7),
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: Center(
                              child: Text(
                            '4:00 AM - 6:00 PM',
                            style: TextStyle(
                                color: Color(0xFF7743DB),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ChoosedTime = '5:00 AM - 6:30 PM';
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice(
                                        appointment: Appointment(
                                            choosedService: ChoosedService,
                                            choosedServiceType:
                                                ChoosedServiceType,
                                            choosedServicePrice:
                                                ChoosedServicePrice,
                                            service: Service,
                                            homeServicePrice: HomeServicePrice,
                                            urgentBook: UrgentBook,
                                            urgentBookPrice: UrgentBookPrice,
                                            selectedDate: SelectedDate,
                                            calDate: CalDate,
                                            choosedTime: ChoosedTime),
                                      )));
                        },
                        child: Container(
                          color: Color(0xFFD0A2F7),
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: Center(
                              child: Text(
                            '5:00 AM - 6:30 PM',
                            style: TextStyle(
                                color: Color(0xFF7743DB),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ]),
                  ),
                ]),
          ),
        ),
        bottomNavigationBar: BottomMenu(activeIndex: 0),
      ),
    );
  }
}

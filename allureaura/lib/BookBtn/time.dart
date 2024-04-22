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
  late String Username;
  late String ChosenService;
  late String ChosenServiceType;
  late int ChosenServicePrice;
  late String Service;
  late int HomeServicePrice;
  late String UrgentBook;
  late int UrgentBookPrice;
  late DateTime SelectedDate;
  late DateTime CalDate;
  String ChosenTime = 'ChosenTime';

  @override
  void initState() {
    super.initState();

    Username = widget.appointment.username;
    ChosenService = widget.appointment.chosenService;
    ChosenServiceType = widget.appointment.chosenServiceType ?? '';
    ChosenServicePrice = widget.appointment.chosenServicePrice ?? 0;
    Service = widget.appointment.service ?? '';
    HomeServicePrice = widget.appointment.homeServicePrice ?? 0;
    UrgentBook = widget.appointment.urgentBook ?? '';
    UrgentBookPrice = widget.appointment.urgentBookPrice ?? 0;
    SelectedDate = widget.appointment.selectedDate ?? DateTime.now();
    CalDate = widget.appointment.calDate ?? DateTime.now();
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: 10, minute: 0), // Set initial time to 10:00 AM
    );
    if (picked != null) {
      if (picked.hour >= 10 && picked.hour < 18) {
        setState(() {
          ChosenTime = '${picked.hour}:${picked.minute}';
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Invoice(
              appointment: Appointment(
                username: Username,
                chosenService: ChosenService,
                chosenServiceType: ChosenServiceType,
                chosenServicePrice: ChosenServicePrice,
                service: Service,
                homeServicePrice: HomeServicePrice,
                urgentBook: UrgentBook,
                urgentBookPrice: UrgentBookPrice,
                selectedDate: SelectedDate,
                calDate: CalDate,
                chosenTime: ChosenTime,
              ),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please choose a time between 10:00 AM and 6:00 PM.'),
          ),
        );
      }
    }
  }

  Widget build(BuildContext context) {
    print('Time choosedServiceType: ${widget.appointment.chosenServiceType}');
    print('ChosenServicePrice: ${widget.appointment.chosenServicePrice}');
    print('Urgent Book: ${widget.appointment.urgentBook}');
    print('Urgent Book Price: ${widget.appointment.urgentBookPrice}');
    print('ChosenService: ${widget.appointment.chosenService}');
    print('Service: ${widget.appointment.service}');
    print('Home Service Price: ${widget.appointment.homeServicePrice}');
    print('Selected Date: ${widget.appointment.selectedDate}');
    print('Calender Date: ${widget.appointment.calDate}');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                  ElevatedButton(
                    onPressed: () {
                      selectTime(context);
                    },
                    child: Text('Choose Time'),
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

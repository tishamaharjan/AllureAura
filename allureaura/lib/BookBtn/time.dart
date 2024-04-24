import 'dart:convert';
import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/config.dart';
import 'package:allureaura/invoice.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

import 'package:http/http.dart' as http;

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
      initialTime: TimeOfDay(hour: 10, minute: 0),
    );
    if (picked != null) {
      if (picked.hour >= 10 && picked.hour < 18) {
        setState(() {
          ChosenTime = '${picked.hour}:${picked.minute}';
        });
        checkAppointmentAvailability();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please choose a time between 10:00 AM and 6:00 PM.'),
          ),
        );
      }
    }
  }

  Future<void> checkAppointmentAvailability() async {
    final response = await http.get(Uri.parse(appointment));

    if (response.statusCode == 200) {
      final appointments = json.decode(response.body);
      bool isAppointmentAvailable = true;

      for (var appointmentJson in appointments) {
        final appointment = Appointment.fromJson(appointmentJson);
        if (appointment.selectedDate != null &&
            appointment.chosenTime != null) {
          if (appointment.selectedDate == SelectedDate &&
              appointment.chosenTime == ChosenTime) {
            isAppointmentAvailable = false;
            break;
          }
        }
      }

      if (isAppointmentAvailable) {
        navigateToInvoice();
      } else {
        saveToWaitingList();
      }
    } else {
      print('Failed to check appointment availability');
    }
  }

  Future<void> saveToWaitingList() async {
    final appointmentData = {
      'username': Username,
      'chosenService': ChosenService,
      'chosenServiceType': ChosenServiceType,
      'chosenServicePrice': ChosenServicePrice,
      'service': Service,
      'homeServicePrice': HomeServicePrice,
      'urgentBook': UrgentBook,
      'urgentBookPrice': UrgentBookPrice,
      'selectedDate': SelectedDate.toIso8601String(),
      'calDate': CalDate.toIso8601String(),
      'chosenTime': ChosenTime,
    };

    final response = await http.post(
      Uri.parse(waitinglist),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(appointmentData),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'The selected time is not available. You have been added to the waiting list. Please choose another time too.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error while booking appointment. Please book again.'),
        ),
      );
    }
  }

  void navigateToInvoice() {
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
  }

  Widget build(BuildContext context) {
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

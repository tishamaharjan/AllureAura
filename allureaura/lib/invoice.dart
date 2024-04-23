import 'dart:convert';
import 'package:allureaura/BookBtn/payment.dart';
import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/buttommenu.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'config.dart';

class Invoice extends StatefulWidget {
  final Appointment appointment;

  const Invoice({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  late String Username;
  late int ChosenServicePrice;
  late int HomeServicePrice;
  late int UrgentBookPrice;
  int TotalPrice = 0;
  bool notvalid = false;
  late String username;

  @override
  void initState() {
    super.initState();

    Username = widget.appointment.username;
    ChosenServicePrice = widget.appointment.chosenServicePrice ?? 0;
    HomeServicePrice = widget.appointment.homeServicePrice ?? 0;
    UrgentBookPrice = widget.appointment.urgentBookPrice ?? 0;
  }

  Future<void> appointmentDetail() async {
    try {
      print('1  Here');
      var appointmentDetails = {
        "username": widget.appointment.username,
        "chosenService": widget.appointment.chosenService,
        "chosenServiceType": widget.appointment.chosenServiceType,
        "chosenServicePrice": widget.appointment.chosenServicePrice,
        "service": widget.appointment.service,
        "homeServicePrice": widget.appointment.homeServicePrice,
        "urgentBook": widget.appointment.urgentBook,
        "urgentBookPrice": widget.appointment.urgentBookPrice,
        "selectedDate": widget.appointment.selectedDate.toString(),
        "chosenTime": widget.appointment.chosenTime,
        "totalPrice": TotalPrice,
      };
      print('2  Here');
      //Making HTTP POST request to the backend API
      final response = await http.post(
        Uri.parse(appointment),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(appointmentDetails),
      );
      print('3  Here');
      var jsonResponse = jsonDecode(response.body);
      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      debugPrint(jsonResponse['status'].toString());
      print('Yeta  Here');

      if (response.statusCode == 201) {
        print('Yeta Yeta Here');
        print("Appointment details saved successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PayChoose(
                    appointment: Appointment(
                      username: Username,
                      fullname: '',
                      email: '',
                      phonenumber: '',
                      chosenService: 'choosedService',
                    ),
                  )),
        );
      } else {
        //final errorResponse = jsonDecode(response.body);
        print('Failed to book appointment.');

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error!!"),
              content: Text("Error while booking appointment."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print("Exception occurred: $e");

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred: $e"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Widget build(BuildContext context) {
    TotalPrice = ChosenServicePrice + HomeServicePrice + UrgentBookPrice;
    print('Selected Time: ${widget.appointment.chosenTime}');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFE5D4FF),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Container(
                      height: 58,
                      child: Center(
                        child: Text(
                          'Invoice',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: MediaQuery.of(context).size.width * 0.10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7743DB),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      color: Color(0xFFF1EAFF),
                      child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '  Username:\n  ${widget.appointment.username}\n',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Chosen Service:\n  ${widget.appointment.chosenService}\n',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Chosen Service Type:\n  ${widget.appointment.chosenServiceType ?? '-'}\n',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Chosen Service Price:\n  ${widget.appointment.chosenServicePrice ?? '-'}\n',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Verdana'),
                            ),
                            Text(
                              '  Service:\n  ${widget.appointment.service ?? '-'}\n',
                              style: TextStyle(
                                //fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Home Service Price:\n  ${widget.appointment.homeServicePrice ?? '-'}\n',
                              style: TextStyle(
                                //fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Urgent Booking:\n  ${widget.appointment.urgentBook ?? '-'}\n',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Urgent Booking Price:\n  ${widget.appointment.urgentBookPrice ?? '-'}\n',
                              style: TextStyle(
                                //fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Selected Date:\n  ${widget.appointment.selectedDate != null ? DateFormat.yMMMd().format(widget.appointment.selectedDate!) : 'No date selected'}\n',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Chosen Time:\n  ${widget.appointment.chosenTime ?? '-'}',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' \n--- Total Price: ---\n      ${TotalPrice}',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          appointmentDetail();
                        },
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            color:
                                Color(0xFF7743DB), // Text color of the button
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ))),
        bottomNavigationBar: BottomMenu(
          activeIndex: 0,
          token: '',
          username: Username,
        ),
      ),
    );
  }
}

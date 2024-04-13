import 'dart:convert';
import 'package:allureaura/BookBtn/payment.dart';
import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/buttommenu.dart';
import 'package:flutter/material.dart';
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
  late int ChoosedServicePrice;
  late int HomeServicePrice;
  late int UrgentBookPrice;
  int TotalPrice = 0;
  bool notvalid = false;

  @override
  void initState() {
    super.initState();
    ChoosedServicePrice = widget.appointment.choosedServicePrice ?? 0;
    HomeServicePrice = widget.appointment.homeServicePrice ?? 0;
    UrgentBookPrice = widget.appointment.urgentBookPrice ?? 0;
  }

  Future<void> appointmentDetail() async {
    try {
      print('1  Here');
      var appointmentDetails = {
        "choosedService": widget.appointment.choosedService,
        "choosedServiceType": widget.appointment.choosedServiceType,
        "choosedServicePrice": widget.appointment.choosedServicePrice,
        "homeServicePrice": widget.appointment.homeServicePrice,
        "urgentBookPrice": widget.appointment.urgentBookPrice,
        "selectedDate": widget.appointment.selectedDate.toString(),
        "choosedTime": widget.appointment.choosedTime,
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
          MaterialPageRoute(builder: (context) => PayChoose()),
        );
      } else {
        final errorResponse = jsonDecode(response.body);
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
    TotalPrice = ChoosedServicePrice + HomeServicePrice + UrgentBookPrice;
    print('Selected Time: ${widget.appointment.choosedTime}');
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
                              '  Choosed Service:\n  ${widget.appointment.choosedService}\n',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Choosed Service Type:\n  ${widget.appointment.choosedServiceType ?? '-'}\n',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '  Choosed Service Price:\n  ${widget.appointment.choosedServicePrice ?? '-'}\n',
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
                              '  HomeService Price:\n  ${widget.appointment.homeServicePrice ?? '-'}\n',
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
                              '  Choosed Time:\n  ${widget.appointment.choosedTime ?? '-'}',
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
        bottomNavigationBar: BottomMenu(activeIndex: 0),
      ),
    );
  }
}

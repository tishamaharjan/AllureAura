import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/buttommenu.dart';
import 'package:allureaura/BookBtn/payment.dart';

import 'package:http/http.dart' as http;
import 'config.dart';

class CourseInvoice extends StatefulWidget {
  final Appointment appointment;

  const CourseInvoice({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  @override
  State<CourseInvoice> createState() => _CourseInvoiceState();
}

class _CourseInvoiceState extends State<CourseInvoice> {
  late String Username;
  late String ChosenCourseService;
  late int TotalCoursePrice;

  @override
  void initState() {
    super.initState();

    Username = widget.appointment.username;
    ChosenCourseService = widget.appointment.chosenCourseService ?? "";
    TotalCoursePrice = widget.appointment.totalCoursePrice ?? 0;
  }

  Future<void> courseDetail() async {
    try {
      var courseDetails = {
        "username": widget.appointment.username,
        "chosenService": widget.appointment.chosenCourseService,
        "totalPrice": widget.appointment.totalCoursePrice,
      };
      //Making HTTP POST request to the backend API of course
      final response = await http.post(
        Uri.parse(course),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(courseDetails),
      );
      var jsonResponse = jsonDecode(response.body);
      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      debugPrint(jsonResponse['status'].toString());
      print('Yeta Course Course Here');

      if (response.statusCode == 201) {
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
        print('Failed to book appointment.');

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error!!"),
              content: Text("Error while booking course."),
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                              '  Chosen Course:\n  ${widget.appointment.chosenCourseService}\n',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' \n--- Total Price: ---\n        ${widget.appointment.totalCoursePrice}\n',
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
                          courseDetail();
                        },
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            color: Color(0xFF7743DB),
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

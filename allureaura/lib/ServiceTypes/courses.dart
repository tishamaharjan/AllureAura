import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/courseinvoice.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Courses extends StatefulWidget {
  final Appointment appointment;
  const Courses({required this.appointment, Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  late String Username;
  late String ChosenCourseService;
  int CoursePrice = 0;

  @override
  void initState() {
    super.initState();

    Username = widget.appointment.username;
    ChosenCourseService = widget.appointment.chosenCourseService ?? '';
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
                    'COURSES',
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
                                'Makeup\nPrice: 10000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ChosenCourseService = 'Makeup';
                                    CoursePrice = 10000;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CourseInvoice(
                                                appointment: Appointment(
                                                    username: Username,
                                                    chosenService:
                                                        'ChosenService',
                                                    chosenCourseService:
                                                        ChosenCourseService,
                                                    totalCoursePrice:
                                                        CoursePrice),
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
                                'Full course\nPrice: 20000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ChosenCourseService = 'Full Course';
                                    CoursePrice = 20000;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CourseInvoice(
                                                appointment: Appointment(
                                                    username: Username,
                                                    chosenService:
                                                        'ChosenService',
                                                    chosenCourseService:
                                                        ChosenCourseService,
                                                    totalCoursePrice:
                                                        CoursePrice),
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
                                'Hair\nPrice: 8000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ChosenCourseService = 'Hair';
                                    CoursePrice = 8000;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CourseInvoice(
                                                appointment: Appointment(
                                                    username: Username,
                                                    chosenService:
                                                        'ChosenService',
                                                    chosenCourseService:
                                                        ChosenCourseService,
                                                    totalCoursePrice:
                                                        CoursePrice),
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
        bottomNavigationBar:
            BottomMenu(activeIndex: 0, token: '', username: Username),
      ),
    );
  }
}

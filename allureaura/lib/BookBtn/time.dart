import 'package:allureaura/BookBtn/payment.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String ChoosedTime = 'Choosed_Time';

  @override
  Widget build(BuildContext context) {
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
                                  builder: (context) => PayChoose()));
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
                                  builder: (context) => PayChoose()));
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
                                  builder: (context) => PayChoose()));
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
                                  builder: (context) => PayChoose()));
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
                                  builder: (context) => PayChoose()));
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
                                  builder: (context) => PayChoose()));
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
                                  builder: (context) => PayChoose()));
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

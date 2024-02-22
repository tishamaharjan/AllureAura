import 'package:flutter/material.dart';
import 'buttommenu.dart';

class Homeinitial extends StatefulWidget {
  const Homeinitial({super.key});

  @override
  State<Homeinitial> createState() => _HomeinitialState();
}

class _HomeinitialState extends State<Homeinitial> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your other widgets and content here
                SizedBox(height: 50.0),
                Text(
                  'Welcome to Allure Aura!!!!!',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  'What would you like to book the appointment for?',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 30.0),

                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Colors.purple,
                              margin: EdgeInsets.all(20.0),
                              padding: EdgeInsets.all(10.0),
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                              alignment: Alignment.center,
                              child: Center(
                                  child: Text(
                                'Make Up',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.purple,
                              margin: EdgeInsets.all(20.0),
                              padding: EdgeInsets.all(10.0),
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                              alignment: Alignment.center,
                              child: Center(
                                  child: Text(
                                'Hair Styles',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              color: Colors.purple,
                              margin: EdgeInsets.all(20.0),
                              padding: EdgeInsets.all(10.0),
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                              alignment: Alignment.center,
                              child: Center(
                                  child: Text(
                                'Nail Art and Extensions',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.purple,
                              margin: EdgeInsets.all(20.0),
                              padding: EdgeInsets.all(10.0),
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                              alignment: Alignment.center,
                              child: Center(
                                  child: Text(
                                'Skin Care',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              color: Colors.purple,
                              margin: EdgeInsets.all(20.0),
                              padding: EdgeInsets.all(10.0),
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                              alignment: Alignment.center,
                              child: Center(
                                  child: Text(
                                'Manicure/ Pedicure',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.purple,
                              margin: EdgeInsets.all(20.0),
                              padding: EdgeInsets.all(10.0),
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                              alignment: Alignment.center,
                              child: Center(
                                  child: Text(
                                'Courses',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                      ],
                    )),

                // Add more widgets as needed

                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => const Login()),
                //     );
                //   },
                //   child: Text('Logout'),
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenu(activeIndex: 0),
      ),
    );
  }
}

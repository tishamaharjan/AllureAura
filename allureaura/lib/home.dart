import 'package:flutter/material.dart';
import './ServiceTypes/Makeup.dart';
import './ServiceTypes/hair.dart';
import './ServiceTypes/nail.dart';
import './ServiceTypes/skin.dart';
import './ServiceTypes/manipedi.dart';
import './ServiceTypes/courses.dart';
import 'buttommenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
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
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your other widgets and content here
                SizedBox(height: 50.0),
                Text(
                  'Welcome to Allure Aura!',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7743DB),
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  'Please, choose your desired option.',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Color(0xFF7743DB),
                  ),
                ),

                SizedBox(height: 30.0),

                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Makeup()));
                              },
                              child: Container(
                                color: Color(0xFFD0A2F7),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.all(10.0),
                                height: 100.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'Make Up',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hair()));
                              },
                              child: Container(
                                color: Color(0xFFD0A2F7),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.all(10.0),
                                height: 100.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'Hair Styles',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Nail()));
                              },
                              child: Container(
                                color: Color(0xFFD0A2F7),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.all(10.0),
                                height: 100.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'Nail Art and Extensions',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Skin()));
                              },
                              child: Container(
                                color: Color(0xFFD0A2F7),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.all(10.0),
                                height: 100.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'Skin Care',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ManiPedi()));
                              },
                              child: Container(
                                color: Color(0xFFD0A2F7),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.all(10.0),
                                height: 100.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'Manicure/Pedicure',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Courses()));
                              },
                              child: Container(
                                color: Color(0xFFD0A2F7),
                                margin: EdgeInsets.all(20.0),
                                padding: EdgeInsets.all(10.0),
                                height: 100.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'Courses',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
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

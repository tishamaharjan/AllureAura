import 'package:allureaura/appointmentDetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ServiceTypes/makeup.dart';
import './ServiceTypes/hair.dart';
import './ServiceTypes/nail.dart';
import './ServiceTypes/skin.dart';
import './ServiceTypes/manipedi.dart';
import './ServiceTypes/courses.dart';
import 'buttommenu.dart';

class Home extends StatefulWidget {
  final String token;
  final String username;

  const Home({required this.token, required this.username, Key? key})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Map<String, String>> preferencesFuture;

  @override
  void initState() {
    super.initState();
    preferencesFuture = loadPreferences();
  }

  Future<Map<String, String>> loadPreferences() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String token = prefer.getString('token') ?? widget.token;
    String username = prefer.getString('username') ?? widget.username;
    return {'token': token, 'username': username};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: preferencesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          // Use the data to initialize the Home widget
          String token = snapshot.data!['token']!;
          String username = snapshot.data!['username']!;
          return buildHomeScreen(context, token, username);
        } else {
          return Center(child: Text('Failed to load preferences'));
        }
      },
    );
  }

  Widget buildHomeScreen(BuildContext context, String token, String username) {
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
                                //Creating an instance
                                Appointment appointment = Appointment(
                                  username: username,
                                  choosedService: 'Makeup',
                                );
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Makeup(appointment: appointment)));
                              },
                              child: ServiceOptions(SerName: 'Make Up'),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Appointment appointment = Appointment(
                                    username: username,
                                    choosedService: 'Hair',
                                  );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Hair(appointment: appointment)));
                                },
                                child: ServiceOptions(SerName: 'Hair')),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Appointment appointment = Appointment(
                                    username: username,
                                    choosedService: 'Nail',
                                  );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Nail(appointment: appointment)));
                                },
                                child: ServiceOptions(SerName: 'Nail')),
                            GestureDetector(
                                onTap: () {
                                  Appointment appointment = Appointment(
                                    username: username,
                                    choosedService: 'Skin',
                                  );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Skin(appointment: appointment)));
                                },
                                child: ServiceOptions(SerName: 'Skin')),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Appointment appointment = Appointment(
                                    username: username,
                                    choosedService: 'ManiPedi',
                                  );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ManiPedi(
                                              appointment: appointment)));
                                },
                                child: ServiceOptions(SerName: 'ManiPedi')),
                            GestureDetector(
                                onTap: () {
                                  Appointment appointment = Appointment(
                                    username: username,
                                    choosedService: 'Courses',
                                  );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Courses(
                                              appointment: appointment)));
                                },
                                child: ServiceOptions(SerName: 'Courses')),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenu(
          activeIndex: 0,
          token: token,
          username: username,
        ),
      ),
    );
  }
}

//--- Widget for ServiceOptions ---//

class ServiceOptions extends StatefulWidget {
  final String SerName;

  const ServiceOptions({
    required this.SerName,
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceOptions> createState() => _ServiceOptionsState();
}

class _ServiceOptionsState extends State<ServiceOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFD0A2F7),
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(10.0),
      height: 100.0,
      width: MediaQuery.of(context).size.width * 0.3,
      alignment: Alignment.center,
      child: Center(
          child: Text(
        widget.SerName,
        style: TextStyle(
            color: Color(0xFF7743DB),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}

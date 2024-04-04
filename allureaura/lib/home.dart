import 'package:allureaura/appointmentDetails.dart';
import 'package:flutter/material.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
import './ServiceTypes/makeup.dart';
import './ServiceTypes/hair.dart';
import './ServiceTypes/nail.dart';
import './ServiceTypes/skin.dart';
import './ServiceTypes/manipedi.dart';
import './ServiceTypes/courses.dart';
import 'buttommenu.dart';

class Home extends StatefulWidget {
  final token;
  const Home({@required this.token, Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String username;
  String ChoosedService = 'ChoosedService';
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

  //   username = jwtDecodedToken['username'];
  // }

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
                                //Creating an instance
                                Appointment appointment = Appointment(
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
        bottomNavigationBar: BottomMenu(activeIndex: 0),
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

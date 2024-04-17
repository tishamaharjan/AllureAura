import 'dart:convert';
import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/login.dart';
import 'package:flutter/material.dart';
import 'buttommenu.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class Profile extends StatefulWidget {
  final Appointment appointment;
  const Profile({required this.appointment, Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String Username;
  Future<List<Appointment>>? appointmentsFuture;

  @override
  void initState() {
    super.initState();

    Username = widget.appointment.username;
    appointmentsFuture = fetchAppointments(); // Initialize the future
  }

  Future<List<Appointment>> fetchAppointments() async {
    final response = await http.get(
      Uri.parse(appointment),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      List appDetails = jsonDecode(response.body);
      return appDetails
          .map((appointment) => Appointment.fromJson(appointment))
          .toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }

// Method to build a list of appointment cards
  Widget buildAppointmentList(List<Appointment> appointments) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        // Display each appointment as a ListTile or Card
        Appointment appointment = appointments[index];
        return ListTile(
          title: Text('Appointment with ${appointment.choosedService}'),
          subtitle: Text('Date: ${appointment.selectedDate}'),
        );
      },
    );
  }

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
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your other widgets and content here

                Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7743DB),
                  ),
                ),

                SizedBox(height: 20.0),

                //Appointment List
                FutureBuilder<List<Appointment>>(
                  future: appointmentsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Loading indicator while waiting for data
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Display error message if there is an error
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      // If data is available, build the list of appointments
                      List<Appointment> appointments = snapshot.data!;
                      return buildAppointmentList(appointments);
                    } else {
                      // No data available
                      return Center(child: Text('No appointments found'));
                    }
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFD67BFF))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenu(
          activeIndex: 2,
          token: '',
          username: Username,
        ),
      ),
    );
  }
}

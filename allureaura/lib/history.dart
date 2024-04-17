import 'dart:convert';
import 'package:allureaura/appointmentDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'buttommenu.dart';

import 'package:http/http.dart' as http;
import 'config.dart';

class History extends StatefulWidget {
  final Appointment appointment;
  const History({required this.appointment, Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late SharedPreferences prefer;

  late String username;
  Future<List<Appointment>>? appointmentsFuture;
  @override
  void initState() {
    super.initState();
    loadPreferences();

    username = widget.appointment.username;
    appointmentsFuture = fetchAppointments(); // Initialize the future
  }

  void loadPreferences() async {
    prefer = await SharedPreferences.getInstance();

    username = prefer.getString('username') ?? widget.appointment.username;
  }

// Function to mark appointment as completed
  // void completeAppointment(Appointment appointment) async {
  //   final response = await http.post(
  //     Uri.parse('your_backend_url_to_mark_appointment_completed'),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({"appointmentId": appointment.id}),
  //   );

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       appointmentsFuture = fetchAppointments();
  //     });
  //   } else {
  //     print('Failed to mark appointment as completed');
  //   }
  // }

// Function to cancel appointment
  // void cancelAppointment(Appointment appointment) async {
  //   final response = await http.delete(
  //     Uri.parse('your_backend_url_to_cancel_appointment'),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({"appointmentId": appointment.id}),
  //   );

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       appointmentsFuture = fetchAppointments();
  //     });
  //   } else {
  //     print('Failed to cancel appointment');
  //   }
  // }

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

  // Method to build a list of appointment containers
  Widget buildAppointmentList(List<Appointment> appointments) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        // Display each appointment as a ListTile or Card
        Appointment appointment = appointments[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service: ${appointment.choosedService}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text('Appointment booked by ${appointment.username}'),
              Text('Appointment of ${appointment.choosedService}'),
              Text('Choosed Service: ${appointment.choosedServiceType}'),
              Text('Choosed Service Price: ${appointment.choosedServicePrice}'),
              Text('HomeServicePrice: ${appointment.homeServicePrice}'),
              Text('UrgentServicePrice: ${appointment.urgentBookPrice}'),
              Text('Date: ${appointment.selectedDate}'),
              Text('Time: ${appointment.choosedTime}'),
              Text('Total Price: ${appointment.totalPrice}'),

              // Adding buttons
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle appointment completion
                      //completeAppointment(appointment);
                    },
                    child: Text('Completed'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Handle appointment cancellation
                      //cancelAppointment(appointment);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
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
                  'Appointment History',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7743DB),
                  ),
                ),

                SizedBox(height: 20.0),

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

                // Add more widgets as needed
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenu(
          activeIndex: 1,
          token: '',
          username: widget.appointment.username,
        ),
      ),
    );
  }
}

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
  Future<List<Appointment>>? completedAppointmentsFuture;

  @override
  void initState() {
    super.initState();
    loadPreferences();

    username = widget.appointment.username;
    appointmentsFuture = fetchAppointments(); // Initialize the future
    completedAppointmentsFuture = fetchCompletedAppointments();
  }

  Future<void> loadPreferences() async {
    prefer = await SharedPreferences.getInstance();

    username = prefer.getString('username') ?? widget.appointment.username;
  }

  Future<List<Appointment>> fetchAppointments() async {
    final response = await http.get(
      Uri.parse(appointment),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      List<dynamic> appDetails = jsonDecode(response.body);
      return appDetails
          .map((appointment) => Appointment.fromJson(appointment))
          .toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  Future<List<Appointment>> fetchCompletedAppointments() async {
    final response = await http.get(
      Uri.parse(complete),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      List<dynamic> completedAppDetails = jsonDecode(response.body);
      return completedAppDetails
          .map((completedAppointment) =>
              Appointment.fromJson(completedAppointment))
          .toList();
    } else {
      throw Exception('Failed to load completed appointments');
    }
  }

// Function to mark appointment as completed
  void completeAppointment(Appointment appointment) async {
    final response = await http.post(
      Uri.parse(complete),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"appointmentID": appointment.id}),
    );
    //debugPrint('ID: ${appointmentID}');

    if (response.statusCode == 200) {
      setState(() {
        appointmentsFuture = fetchAppointments();
      });
      // Show a success notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Appointment marked as completed.')),
      );
    } else {
      // Show an error notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to mark appointment as completed.')),
      );
    }
  }

// Function to cancel appointment
  void cancelAppointment(Appointment appointments) async {
    print('Cancel Appointment: $appointments');
    print('Cancel Appointment ID: ${appointments.id}');

    final response = await http.delete(
      Uri.parse('$appointment/${appointments.id}'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        appointmentsFuture = fetchAppointments();
      });
      // Show a success notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Appointment canceled successfully.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to cancel appointment.')),
      );
      print('Failed to cancel appointment');
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  // Method to build a list of appointment containers
  Widget buildAppointmentList(List<Appointment> appointments) {
    List<Appointment> filteredAppointments = appointments
        .where((appointment) => appointment.username == username)
        .toList();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredAppointments.length,
      itemBuilder: (context, index) {
        // Display each appointment in a card
        Appointment appointment = filteredAppointments[index];
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
              Text('Appointment ID ${appointment.id}'),
              Text('Appointment booked by ${appointment.username}'),
              Text('Appointment of ${appointment.choosedService}'),
              Text('Choosed Service: ${appointment.choosedServiceType}'),
              Text('Choosed Service Price: ${appointment.choosedServicePrice}'),
              Text('Service: ${appointment.service}'),
              Text('Home Service Price: ${appointment.homeServicePrice}'),
              Text('Urgent Book: ${appointment.urgentBook}'),
              Text('Urgent Service Price: ${appointment.urgentBookPrice}'),
              Text('Date: ${appointment.selectedDate}'),
              Text('Time: ${appointment.choosedTime}'),
              Text('Total Price: ${appointment.totalPrice}'),

              // Adding buttons
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle appointment completion
                      completeAppointment(appointment);
                    },
                    child: Text('Completed'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Handle appointment cancellation
                      cancelAppointment(appointment);
                    },
                    child: Text('Cancel appointment'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildCompletedAppointmentList(List<Appointment> appointments) {
    List<Appointment> filteredAppointments = appointments
        .where((appointment) => appointment.username == username)
        .toList();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredAppointments.length,
      itemBuilder: (context, index) {
        Appointment appointment = filteredAppointments[index];
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
              Text('Service: ${appointment.choosedService}',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Appointment ID: ${appointment.id}'),
              Text('Appointment booked by ${appointment.username}'),
              Text('Appointment of ${appointment.choosedService}'),
              Text('Choosed Service: ${appointment.choosedServiceType}'),
              Text('Choosed Service Price: ${appointment.choosedServicePrice}'),
              Text('Service: ${appointment.service}'),
              Text('Home Service Price: ${appointment.homeServicePrice}'),
              Text('Urgent Book: ${appointment.urgentBook}'),
              Text('Urgent Service Price: ${appointment.urgentBookPrice}'),
              Text('Date: ${appointment.selectedDate}'),
              Text('Time: ${appointment.choosedTime}'),
              Text('Total Price: ${appointment.totalPrice}'),
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
                Text(
                  'Booked Appointments',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7743DB),
                  ),
                ),

                SizedBox(height: 10.0),

                FutureBuilder<List<Appointment>>(
                  future: appointmentsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Loading indicator while waiting for data
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Display error message if there is an error
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      // If data is available, build the list of appointments
                      List<Appointment> appointments = snapshot.data!;
                      return buildAppointmentList(appointments);
                    } else {
                      // No data available
                      return const Center(child: Text('No appointments found'));
                    }
                  },
                ),
                SizedBox(height: 40.0),
                Text(
                  'Completed Appointments',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7743DB),
                  ),
                ),

                SizedBox(height: 10.0),

                // FutureBuilder for completed appointments
                FutureBuilder<List<Appointment>>(
                  future: completedAppointmentsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Loading indicator while waiting for data
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Display error message if there is an error
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      // If data is available, build the list of completed appointments
                      List<Appointment> appointments = snapshot.data!;
                      return buildCompletedAppointmentList(appointments);
                    } else {
                      // No data available
                      return const Center(
                          child: Text('No completed appointments found'));
                    }
                  },
                ),
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

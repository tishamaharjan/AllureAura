import 'dart:convert';
import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/login.dart';
import 'package:flutter/material.dart';
import 'buttommenu.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final Appointment appointment;
  const Profile({required this.appointment, Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences prefer;
  late String username;

  @override
  void initState() {
    super.initState();

    username = widget.appointment.username;
    debugPrint('Username: ${username}');
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    final Uri url = Uri.parse('$user/$username');
    debugPrint('Requesting user details from URL: $url');
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      debugPrint('User details: ${response.statusCode} - ${response.body}');

      if (responseData['status'] == true && responseData.containsKey('user')) {
        final Map<String, dynamic> userData = responseData['user'];
        return userData;
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      debugPrint(
          'Failed to load user details: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to load user details');
    }
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
                  'My Profile',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7743DB),
                  ),
                ),

                SizedBox(height: 20.0),

                // FutureBuilder to get and display user details
                FutureBuilder<Map<String, dynamic>>(
                  future: getUserDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Show loading indicator while waiting for data
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Display error message if there is an error
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      // Display user details
                      Map<String, dynamic> userDetails = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Full Name: ${userDetails['fullname']}'),
                          Text('Username: ${userDetails['username']}'),
                          Text('Email: ${userDetails['email']}'),
                          Text('Phone Number: ${userDetails['phonenumber']}'),
                        ],
                      );
                    } else {
                      // No data available
                      return Center(child: Text('No user details found'));
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
          username: username,
        ),
      ),
    );
  }
}

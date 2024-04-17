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

  late TextEditingController _fullnameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();

    username = widget.appointment.username;
    debugPrint('Username: ${username}');

    _fullnameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    fetchAndSetUserDetails();
  }

  void fetchAndSetUserDetails() async {
    try {
      final Uri url = Uri.parse('$user/$username');
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['status'] == true &&
            responseData.containsKey('user')) {
          final Map<String, dynamic> userDetails = responseData['user'];

          // Set controllers' initial values
          _fullnameController.text = userDetails['fullname'] ?? '';
          _emailController.text = userDetails['email'] ?? '';
          _phoneController.text = userDetails['phonenumber'] ?? '';

          // If you need to refresh the screen (e.g. setState to trigger an update),
          // you can use `setState` here
        } else {
          debugPrint('Unexpected response format.');
        }
      } else {
        debugPrint('Failed to fetch user details: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error fetching user details: $error');
    }
  }

  Future<void> saveUserDetails() async {
    final Uri url = Uri.parse('$user/$username');
    final Map<String, dynamic> updatedData = {
      'fullname': _fullnameController.text,
      'email': _emailController.text,
      'phonenumber': _phoneController.text,
    };

    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(updatedData),
    );

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Changes Saved'),
            content: Text('The details have been updated successfully.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      debugPrint('User details updated successfully.');

      // Optionally, you can fetch the updated data and update the state
      fetchAndSetUserDetails(); // Uncomment this line to refresh after update
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error!!'),
            content: Text('Cannot update details. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      debugPrint('Failed to update user details: ${response.statusCode}');
    }
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

  Future<void> updateUserDetails() async {
    final Uri url = Uri.parse('$user/$username');
    final Map<String, dynamic> updatedData = {
      'fullname': _fullnameController.text,
      'email': _emailController.text,
      'phonenumber': _phoneController.text,
    };

    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(updatedData),
    );

    if (response.statusCode == 200) {
      // User details updated successfully
      debugPrint('User details updated successfully.');
      // Optionally, refresh the user details after update
    } else {
      // Handle error appropriately
      debugPrint(
        'Failed to update user details: ${response.statusCode} - ${response.body}',
      );
    }
  }

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
                SizedBox(height: 50.0),
                Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7743DB),
                  ),
                ),

                SizedBox(height: 20.0),

                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Save changes button
                ElevatedButton(
                  onPressed: saveUserDetails,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFD67BFF))),
                  child: Text('Save Changes'),
                ),

                SizedBox(height: 20),

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

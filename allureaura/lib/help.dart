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

// register ko catch ko error handling
// catch (e) {
//       String error = e.toString();
//       print(error);

//       if (error ==
//           "ClientException: {url: http://10.0.2.2:3005/registration, isAbort: false, statusCode: 400, response: {code: 400, message: Failed to create record., data: {username: {code: validation_invalid_username, message: The username is invalid or already in use.}}}, originalError: null}") {
//         return showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               content: Text('This username is already in use.'),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.of(context).pop(false),
//                   child: Text('Ok'),
//                 ),
//               ],
//             );
//           },
//         );
//       } else if (error ==
//           "ClientException: {url: http://10.0.2.2:3005/registration, isAbort: false, statusCode: 400, response: {code: 400, message: Failed to create record., data: {email: {code: validation_invalid_email, message: The email is invalid or already in use.}}}, originalError: null}") {
//         return showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               content: Text('This username is already in use.'),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.of(context).pop(false),
//                   child: Text('Ok'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//       if (error ==
//           "ClientException: {url: http://10.0.2.2:3005/registration, isAbort: false, statusCode: 400, response: {code: 400, message: Failed to create record., data: {phonenumber: {code: validation_invalid_phonenumber, message: The phone number is invalid or already in use.}}}, originalError: null}") {
//         return showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               content: Text('This username is already in use.'),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.of(context).pop(false),
//                   child: Text('Ok'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     }

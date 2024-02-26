import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'config.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  bool notvalid = false;

  void registerUser() async {
    try {
      if (fullName.text.isNotEmpty &&
          userName.text.isNotEmpty &&
          email.text.isNotEmpty &&
          phoneNumber.text.isNotEmpty &&
          password.text.isNotEmpty) {
        var regBody = {
          "fullname": fullName.text,
          "username": userName.text,
          "email": email.text,
          "phonenumber": phoneNumber.text,
          "password": password.text
        };

        var response = await http.post(
          Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );

        var jsonResponse = jsonDecode(response.body);
        debugPrint(jsonResponse['status'].toString());

        if (jsonResponse != null) {
          if (jsonResponse.containsKey('status')) {
            if (jsonResponse['status'] is bool) {
              if (jsonResponse['status']) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              } else {
                print("Invalid Input!!!");
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Invalid Input!!'),
                      content:
                          Text('The values provided is already registered.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            }
          }
        } else if (jsonResponse['!status']) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Email already exists'),
                content: Text('The email is already registered.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          print("Something Went Wrong");
        }
      } else {
        debugPrint("Not working!");
        setState(() {
          notvalid = true;
        });
      }
    } catch (e) {
      String error = e.toString();
      print(error);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('this is error'),
            content: Text(error),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      // if (error.contains("validation_invalid_username")) {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('Username already exists'),
      //         content: Text(
      //             'The username is already in use. Please choose a different username.'),
      //         actions: [
      //           TextButton(
      //             onPressed: () => Navigator.of(context).pop(),
      //             child: Text('OK'),
      //           ),
      //         ],
      //       );
      //     },
      //   );
      // } else if (error.contains("validation_invalid_email")) {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('Email already exists'),
      //         content: Text('The email is already registered.'),
      //         actions: [
      //           TextButton(
      //             onPressed: () => Navigator.of(context).pop(),
      //             child: Text('OK'),
      //           ),
      //         ],
      //       );
      //     },
      //   );
      // } else if (error.contains("validation_invalid_phonenumber")) {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('Phone number already exists'),
      //         content: Text('The number is already registered.'),
      //         actions: [
      //           TextButton(
      //             onPressed: () => Navigator.of(context).pop(),
      //             child: Text('OK'),
      //           ),
      //         ],
      //       );
      //     },
      //   );
      // } else {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('Registration Error'),
      //         content: Text('Something went wrong. Please try again later.'),
      //         actions: [
      //           TextButton(
      //             onPressed: () => Navigator.of(context).pop(),
      //             child: Text('OK'),
      //           ),
      //         ],
      //       );
      //     },
      //   );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFE5D4FF),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                    Container(
                      height: 58,
                      child: Center(
                        child: Text(
                          'Allure Aura',
                          style: TextStyle(
                            fontFamily: 'Viga',
                            fontSize: MediaQuery.of(context).size.width * 0.13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7743DB),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Container(
                      // for signup heading
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.062,
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Container(
                      // for fullname textfield (container)
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.065,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1385,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFD67BFF).withOpacity(0.5),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: fullName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              height: 1.2),
                          prefixIcon:
                              Icon(Icons.person, color: Color(0xFFD67BFF)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        validator: (fullName) {
                          if (fullName == null || fullName.isEmpty) {
                            return 'Please enter your name!';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    Container(
                      // for username
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.065,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1385,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFD67BFF).withOpacity(0.5),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: userName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              height: 1.2),
                          prefixIcon:
                              Icon(Icons.person, color: Color(0xFFD67BFF)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        validator: (userName) {
                          if (userName == null || userName.isEmpty) {
                            return 'Please enter your name!';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    Container(
                      // for email
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.065,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1385,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: email,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              height: 1.2),
                          prefixIcon: Icon(Icons.email_rounded,
                              color: Color(0xFFD67BFF)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please enter your email!';
                          } else if (!email.contains('@')) {
                            return ' Please enter valid email address!';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    Container(
                      // for phone number
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.065,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1385,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: phoneNumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Phone number",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              height: 1.2),
                          prefixIcon:
                              Icon(Icons.phone, color: Color(0xFFD67BFF)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        validator: (phoneNumber) {
                          if (phoneNumber == null || phoneNumber.isEmpty) {
                            return 'Please enter your phone number!';
                          } else if (phoneNumber.length != 10) {
                            return 'Please enter valid  number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    Container(
                      // for password
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.065,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1385,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: password,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              height: 1.2),
                          prefixIcon:
                              Icon(Icons.lock, color: Color(0xFFD67BFF)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Please enter password!';
                          } else if (password.length < 7) {
                            return 'Password must be at least 7 characters!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1385),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          registerUser();
                        },
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.014),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.07,
                          right: MediaQuery.of(context).size.width * 0.07,
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFD67BFF),
                              Color(0xFFD67BFF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            registerUser();
                          },
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        'Already have an account? Sign In',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Color(0xFF7743DB),
                          fontFamily: 'Lato',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameL = TextEditingController();
  TextEditingController passwordL = TextEditingController();
  bool notvalid = false;

  // void registerUser() async {
  //   try {
  //     if (userName.text.isNotEmpty && password.text.isNotEmpty) {
  //       var regBody = {"username": userName.text, "password": password.text};

  //       var response = await http.post(
  //         Uri.parse(),
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode(regBody),
  //       );

  //       var jsonResponse = jsonDecode(response.body);
  //       debugPrint(jsonResponse['status'].toString());

  //       if (jsonResponse['status']) {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => Login()));
  //       } else {
  //         print("Something Went Wrong");
  //       }
  //     } else {
  //       debugPrint("Not working!");
  //       setState(() {
  //         notvalid = true;
  //       });
  //     }
  //   } catch (e) {
  //     debugPrint("Error during registration: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PopScope(
      canPop: false,
      child: Form(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE5D4FF),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    children: [
                      SizedBox(height: constraints.maxWidth * 0.28),
                      Container(
                        height: 58,
                        child: Center(
                          child: Text(
                            'Allure Aura',
                            style: TextStyle(
                              fontFamily: 'Viga',
                              fontSize: constraints.maxWidth * 0.13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7743DB),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxWidth * 0.305),
                      Container(
                        child: Center(
                          child: Text(
                            'Login to your Account',
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.062,
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxWidth * 0.095),
                      Container(
                        width: double.infinity,
                        height: constraints.maxWidth * 0.136,
                        margin: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.1385,
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
                          decoration: InputDecoration(
                            hintText: "Username or Email",
                            hintStyle: TextStyle(
                                fontSize: constraints.maxWidth * 0.035,
                                height: 1.6),
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xFFD67BFF)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxWidth * 0.035),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 0.136,
                        margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.1385,
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
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                height: 1.6),
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xFFD67BFF)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        //color: Colors.black,
                        height: constraints.maxWidth * 0.10,
                        padding: EdgeInsets.only(
                            left: constraints.maxWidth * 0.1385, bottom: 20),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(height: constraints.maxWidth * 0.02),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                            top: constraints.maxWidth * 0.05,
                            left: 70,
                            right: 70,
                          ),
                          width: 250,
                          height: 56,
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.05,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxWidth * 0.045),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          'Do not have an account? Register here',
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            color: Color(0xFF7743DB),
                            fontFamily: 'Lato',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}

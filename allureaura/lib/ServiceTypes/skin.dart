import 'package:allureaura/BookBtn/book.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Skin extends StatefulWidget {
  const Skin({super.key});

  @override
  State<Skin> createState() => _SkinState();
}

class _SkinState extends State<Skin> {
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
            padding: EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0),
                  Text(
                    'SKIN CARE',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7743DB),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Color(0xFFD0A2F7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bridal Makeup\nPrice: 50000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Book()));
                                },
                                child: Text(
                                  'Book',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Color(0xFFD0A2F7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Party Makeup\nPrice: 10000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Book()));
                                },
                                child: Text(
                                  'Book',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Color(0xFFD0A2F7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Simple Makeup\nPrice: 5000\n',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF591D84)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Book()));
                                },
                                child: Text(
                                  'Book',
                                  style: TextStyle(
                                      color: Color(0xFF7743DB),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        bottomNavigationBar: BottomMenu(activeIndex: 0),
      ),
    );
  }
}

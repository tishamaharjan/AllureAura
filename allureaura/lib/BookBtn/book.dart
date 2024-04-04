import 'package:allureaura/BookBtn/urgent.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';

class Book extends StatefulWidget {
  final String choosedServiceType;
  final String choosedServicePrice;

  const Book({
    required this.choosedServiceType,
    required this.choosedServicePrice,
    Key? key,
  }) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  String Service = "Service";
  @override
  Widget build(BuildContext context) {
    print('choosedServiceType: ${widget.choosedServiceType}');
    print('choosedServicePrice: ${widget.choosedServicePrice}');
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
                  SizedBox(height: 150.0),
                  Text(
                    'Booking',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7743DB),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Service = 'HomeService';
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Urgent(
                                      choosedServiceType:
                                          widget.choosedServiceType,
                                      choosedServicePrice:
                                          widget.choosedServicePrice,
                                      service: Service,
                                    )));
                      },
                      child: Text(
                        'Home Service',
                        style: TextStyle(
                          color: Color(0xFF7743DB),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Service = 'InParlour';
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Urgent(
                                      choosedServiceType:
                                          widget.choosedServiceType,
                                      choosedServicePrice:
                                          widget.choosedServicePrice,
                                      service: Service,
                                    )));
                      },
                      child: Text(
                        'In Parlour',
                        style: TextStyle(
                          color: Color(0xFF7743DB),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

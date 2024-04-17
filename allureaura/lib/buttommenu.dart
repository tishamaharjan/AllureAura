import 'package:allureaura/appointmentDetails.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'history.dart';
import 'profile.dart';

class BottomMenu extends StatefulWidget {
  final int activeIndex;
  final String token;
  final String username;

  const BottomMenu(
      {Key? key,
      required this.activeIndex,
      required this.token,
      required this.username})
      : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 65,
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          decoration: BoxDecoration(
            color: Color(0xFFD67BFF),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                                token: widget.token,
                                username: widget.username,
                              )),
                    );
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    color: widget.activeIndex == 0
                        ? Colors.white
                        : Color(0xFF802ABC),
                    size: 38,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                appointment: Appointment(
                                    username: widget.username,
                                    choosedService: 'choosedService'),
                              )),
                    );
                  },
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: widget.activeIndex == 2
                        ? Colors.white
                        : Color(0xFF802ABC),
                    size: 37,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => History(
                                appointment: Appointment(
                                    username: widget.username,
                                    choosedService: 'choosedService'),
                              )),
                    );
                  },
                  icon: Icon(
                    Icons.history_outlined,
                    color: widget.activeIndex == 1
                        ? Colors.white
                        : Color(0xFF802ABC),
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:allureaura/login.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.activeIndex}) : super(key: key);
  final int activeIndex;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
            color: Colors.blue,
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
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    color:
                        widget.activeIndex == 0 ? Colors.yellow : Colors.white,
                    size: 36,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sticky_note_2_outlined,
                    color:
                        widget.activeIndex == 3 ? Colors.yellow : Colors.white,
                    size: 33,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  icon: Icon(
                    Icons.person_2_outlined,
                    color:
                        widget.activeIndex == 4 ? Colors.yellow : Colors.white,
                    size: 34,
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

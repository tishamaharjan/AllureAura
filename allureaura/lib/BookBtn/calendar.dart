import 'package:allureaura/BookBtn/time.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';
import 'package:table_calendar/table_calendar.dart';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  late DateTime _selectedDate;
  late DateTime _calDate;

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? selected = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2100),
  //   );
  //   if (selected != null) {
  //     setState(() {
  //       _selectedDate = selected;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _calDate = DateTime.now();
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
            padding: EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0),
                  Text(
                    'Choose the date',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7743DB),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  TableCalendar(
                    focusedDay: _calDate,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2100),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDate = selectedDay;
                        _calDate = focusedDay;
                      });
                    },
                  ),

                  SizedBox(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Time()));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0xFF7743DB), // Text color of the button
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // _selectedDate == null
                  //     ? Text('No date selected')
                  //     : Text(
                  //         'Selected Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  //       ),
                  // SizedBox(height: 50.0),
                  // ElevatedButton(
                  //   onPressed: () => _selectDate(context),
                  //   child: Text('Select Date'),
                  // ),
                ]),
          ),
        ),
        bottomNavigationBar: BottomMenu(activeIndex: 0),
      ),
    );
  }
}

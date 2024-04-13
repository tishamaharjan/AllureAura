import 'package:allureaura/BookBtn/time.dart';
import 'package:allureaura/appointmentDetails.dart';
import 'package:flutter/material.dart';
import 'package:allureaura/buttommenu.dart';
import 'package:table_calendar/table_calendar.dart';

class Date extends StatefulWidget {
  final Appointment appointment;
  const Date({required this.appointment, Key? key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  late String ChoosedService;
  late String ChoosedServiceType;
  late int ChoosedServicePrice;
  late String Service;
  late int HomeServicePrice;
  late String UrgentBook;
  late int UrgentBookPrice;
  late DateTime selectedDate;
  late DateTime calDate;
  String SelectedDateOnly = 'SelectedDateOnly';

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? selected = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2100),
  //   );
  //   if (selected != null) {
  //     setState(() {
  //       selectedDate = selected;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    ChoosedService = widget.appointment.choosedService;
    ChoosedServiceType = widget.appointment.choosedServiceType ?? '';
    ChoosedServicePrice = widget.appointment.choosedServicePrice ?? 0;
    Service = widget.appointment.service ?? '';
    HomeServicePrice = widget.appointment.homeServicePrice ?? 0;
    UrgentBook = widget.appointment.urgentBook ?? '';
    UrgentBookPrice = widget.appointment.urgentBookPrice ?? 0;
    selectedDate = DateTime.now();
    calDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Calender choosedServiceType: ${widget.appointment.choosedServiceType}');
    print('choosedServicePrice: ${widget.appointment.choosedServicePrice}');
    print('Urgent Book: ${widget.appointment.urgentBook}');
    print('Urgent Book Price: ${widget.appointment.urgentBookPrice}');
    print('choosedService: ${widget.appointment.choosedService}');
    print('Service: ${widget.appointment.service}');
    print('Home Service Price: ${widget.appointment.homeServicePrice}');
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
                    focusedDay: calDate,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2100),
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        selectedDate = selectedDay;
                        calDate = focusedDay;
                      });
                    },
                  ),

                  SizedBox(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        DateTime selectedDateOnly = DateTime(selectedDate.year,
                            selectedDate.month, selectedDate.day);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Time(
                                      appointment: Appointment(
                                          choosedService: ChoosedService,
                                          choosedServiceType:
                                              ChoosedServiceType,
                                          choosedServicePrice:
                                              ChoosedServicePrice,
                                          service: Service,
                                          homeServicePrice: HomeServicePrice,
                                          urgentBook: UrgentBook,
                                          urgentBookPrice: UrgentBookPrice,
                                          selectedDate: selectedDateOnly,
                                          calDate: calDate),
                                    )));
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

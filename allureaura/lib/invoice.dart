import 'package:allureaura/appointmentDetails.dart';
import 'package:allureaura/buttommenu.dart';
import 'package:flutter/material.dart';
import './ServiceTypes/Makeup.dart';
import './ServiceTypes/hair.dart';
import './ServiceTypes/nail.dart';
import './ServiceTypes/skin.dart';
import './ServiceTypes/manipedi.dart';

class Invoice extends StatefulWidget {
  final Appointment appointment;

  const Invoice({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // Text('Choosed Service: ${widget.choosedService}'),
            // Text('Choosed Service Type: ${widget.ChoosedServiceType}'),
            // Text('Choosed Service Price: ${widget.ChoosedServicePrice}'),
            // Text('Service: ${widget.Service}'),
            // Text('Selected Date: ${widget.selectedDate}'),
            // Text('Cal Date: ${widget.calDate}'),
          ]),
        )),
        bottomNavigationBar: BottomMenu(activeIndex: 0),
      ),
    );
  }
}

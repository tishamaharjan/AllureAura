class Appointment {
  //final String username;
  final String choosedService;
  final String? choosedServiceType;
  final int? choosedServicePrice;
  final String? service;
  final int? homeServicePrice;
  final String? urgentBook;
  final int? urgentBookPrice;
  final DateTime? selectedDate;
  final DateTime? calDate;
  final String? choosedTime;

  Appointment({
    //required this.username,
    required this.choosedService,
    this.choosedServiceType,
    this.choosedServicePrice,
    this.service,
    this.homeServicePrice,
    this.urgentBook,
    this.urgentBookPrice,
    this.selectedDate,
    this.calDate,
    this.choosedTime,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      // username: json['username'],
      choosedService: json['choosedService'],
      choosedServiceType: json['choosedServiceType'],
      choosedServicePrice: json['choosedServicePrice'],
      service: json['service'],
      homeServicePrice: json['homeServicePrice'],
      urgentBook: json['urgentBook'],
      urgentBookPrice: json['urgentBookPrice'],
      selectedDate: json['selectedDate'] != null
          ? DateTime.parse(json['selectedDate'])
          : null,
      choosedTime: json['choosedTime'],
      // totalPrice: json['totalPrice'],
    );
  }
}

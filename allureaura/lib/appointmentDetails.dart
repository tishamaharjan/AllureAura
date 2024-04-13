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
}

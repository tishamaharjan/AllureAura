class Appointment {
  final String choosedService;
  final String? choosedServiceType;
  final String? choosedServicePrice;
  final String? service;
  final DateTime? selectedDate;
  final DateTime? calDate;
  final String? choosedTime;

  Appointment({
    required this.choosedService,
    this.choosedServiceType,
    this.choosedServicePrice,
    this.service,
    this.selectedDate,
    this.calDate,
    this.choosedTime,
  });
}

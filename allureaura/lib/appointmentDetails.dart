class Appointment {
  final String? id;
  final String username;
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
  final int? totalPrice;

  final String? fullname;
  final String? email;
  final String? phonenumber;
  final String? feedback;

  Appointment({
    this.id,
    required this.username,
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
    this.totalPrice,
    this.fullname,
    this.email,
    this.phonenumber,
    this.feedback,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      username: json['username'],
      choosedService: json['choosedService'],
      choosedServiceType: json['choosedServiceType'] ?? 'Unknown Type',
      choosedServicePrice: json['choosedServicePrice'] as int?,
      service: json['service'],
      homeServicePrice: json['homeServicePrice'],
      urgentBook: json['urgentBook'],
      urgentBookPrice: json['urgentBookPrice'],
      selectedDate: json['selectedDate'] != null
          ? DateTime.parse(json['selectedDate'])
          : null,
      choosedTime: json['choosedTime'],
      totalPrice: json['totalPrice'],
      fullname: json['fullname'],
      email: json['email'],
      phonenumber: json['phonenumber'],
      feedback: json['feedback'] ?? "",
    );
  }

  // Define the toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'choosedService': choosedService,
      'choosedServiceType': choosedServiceType,
      'choosedServicePrice': choosedServicePrice,
      'service': service,
      'homeServicePrice': homeServicePrice,
      'urgentBook': urgentBook,
      'urgentBookPrice': urgentBookPrice,
      'selectedDate': selectedDate?.toIso8601String(),
      'choosedTime': choosedTime,
      'totalPrice': totalPrice,
      'feedback': feedback,
    };
  }
}

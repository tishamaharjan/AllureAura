class Appointment {
  final String? id;
  final String username;
  final String chosenService;
  final String? chosenServiceType;
  final int? chosenServicePrice;
  final String? service;
  final int? homeServicePrice;
  final String? urgentBook;
  final int? urgentBookPrice;
  final DateTime? selectedDate;
  final DateTime? calDate;
  final String? chosenTime;
  final int? totalPrice;

  final String? fullname;
  final String? email;
  final String? phonenumber;
  final String? feedback;

  final String? chosenCourseService;
  final int? totalCoursePrice;

  Appointment({
    this.id,
    required this.username,
    required this.chosenService,
    this.chosenServiceType,
    this.chosenServicePrice,
    this.service,
    this.homeServicePrice,
    this.urgentBook,
    this.urgentBookPrice,
    this.selectedDate,
    this.calDate,
    this.chosenTime,
    this.totalPrice,
    this.fullname,
    this.email,
    this.phonenumber,
    this.feedback,
    this.chosenCourseService,
    this.totalCoursePrice,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      username: json['username'],
      chosenService: json['chosenService'],
      chosenServiceType: json['chosenServiceType'] ?? 'Unknown Type',
      chosenServicePrice: json['chosenServicePrice'] as int?,
      service: json['service'],
      homeServicePrice: json['homeServicePrice'],
      urgentBook: json['urgentBook'],
      urgentBookPrice: json['urgentBookPrice'],
      selectedDate: json['selectedDate'] != null
          ? DateTime.parse(json['selectedDate'])
          : null,
      chosenTime: json['chosenTime'],
      totalPrice: json['totalPrice'],
      fullname: json['fullname'],
      email: json['email'],
      phonenumber: json['phonenumber'],
      feedback: json['feedback'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'chosenService': chosenService,
      'chosenServiceType': chosenServiceType,
      'chosenServicePrice': chosenServicePrice,
      'service': service,
      'homeServicePrice': homeServicePrice,
      'urgentBook': urgentBook,
      'urgentBookPrice': urgentBookPrice,
      'selectedDate': selectedDate?.toIso8601String(),
      'chosenTime': chosenTime,
      'totalPrice': totalPrice,
      'feedback': feedback,
    };
  }
}

class BookingModel {
  final int? id;
  final int? userId;
  final int? tripId;
  final String? orderNumber;
  final String? payMethod;
  final String? passport;
  final String? country;
  final String? nationality;
  final String? passportImage;
  final String? visaImage;
  final String? passportExpiry;
  final int? tripDuration;
  final String? tripCost;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BookingModel({
    this.id,
    this.userId,
    this.tripId,
    this.orderNumber,
    this.payMethod,
    this.passport,
    this.country,
    this.nationality,
    this.passportImage,
    this.visaImage,
    this.passportExpiry,
    this.tripDuration,
    this.tripCost,
    this.createdAt,
    this.updatedAt,
  });

  factory BookingModel.fromJson(json) {
    return BookingModel(
      id: json['id'],
      userId: json['user_id'],
      tripId: json['trip_id'],
      orderNumber: json['ordernumber'],
      payMethod: json['paymethod'],
      passport: json['passport'],
      country: json['country'],
      nationality: json['nationality'],
      passportImage: json['passportimage'],
      visaImage: json['visaimage'],
      passportExpiry: json['passportexpir'],
      tripDuration: json['tripduration'],
      tripCost: json['trip_cost'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

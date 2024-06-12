class HomeModel {
  int? id;
  String? name;
  String? miniDescription;
  String? description;
  int? duration;
  String? cost;
  String? oldPrice;
  int? userId;
  String? fromDate;
  String? toDate;
  String? fromLocation;
  String? toLocation;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? image;

  HomeModel({
    this.id,
    this.name,
    this.miniDescription,
    this.description,
    this.duration,
    this.cost,
    this.oldPrice,
    this.userId,
    this.fromDate,
    this.toDate,
    this.fromLocation,
    this.toLocation,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      name: json['name'],
      miniDescription: json['minidescription'],
      description: json['description'],
      duration: json['duration'],
      cost: json['cost'],
      oldPrice: json['oldprice'],
      userId: json['user_id'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      fromLocation: json['from_location'],
      toLocation: json['to_location'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'],
    );
  }
}

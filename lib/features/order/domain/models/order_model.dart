import 'package:zepcart/core/common/assets/app_images.dart';

// Model representing detailed order information with a factory constructor for map deserialization.
class OrderModel {
  final String id;
  final String date;
  final String tracking;
  final int quantity;
  final int price;
  final String status;
  final String image;
  final String name;
  final String color;
  final int points;

  const OrderModel({
    required this.id,
    required this.date,
    required this.tracking,
    required this.quantity,
    required this.price,
    required this.status,
    required this.image,
    required this.name,
    required this.color,
    required this.points,
  });

  // Factory constructor to build OrderModel from a map
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      tracking: map['tracking'] ?? '',
      quantity: map['quantity'] ?? 0,
      price: map['price'] ?? 0,
      status: map['status'] ?? '',
      image: map['image'] ?? AppImages.productImage3,
      name: map['name'] ?? 'The North Face 100',
      color: map['color'] ?? 'Marlin Blue',
      points: map['points'] ?? 10,
    );
  }
}

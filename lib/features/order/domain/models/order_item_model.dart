import 'package:zepcart/core/common/assets/app_images.dart';

// Models representing orders with their items, including product details and order totals.
class OrderItemModel {
  final String orderId;
  final double totalAmount;
  final List<ProductItem> items;

  OrderItemModel({required this.orderId, required this.totalAmount, required this.items});
}

class ProductItem {
  final String image;
  final String title;
  final double price;
  final int quantity;

  ProductItem({
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

final List<OrderItemModel> sampleOrders = [
  OrderItemModel(
    orderId: '452135A',
    totalAmount: 1500.00,
    items: [
      ProductItem(
        image: AppImages.productImage3,
        title: 'iPhone 13, 128GB, Pink - Unlocked (Premium)',
        price: 500.00,
        quantity: 1,
      ),

      ProductItem(
        image: AppImages.productImage4,
        title: 'iPhone 13, 128GB, Blue - Unlocked (Premium)',
        price: 500.00,
        quantity: 1,
      ),
    ],
  ),
];

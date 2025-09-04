// orders_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/features/order/domain/models/order_model.dart';

// Base orders list
final allOrdersProvider = Provider<List<OrderModel>>((ref) {
  return [
    OrderModel(
      id: '458658',
      date: '2025-08-01',
      tracking: 'TRK123456',
      quantity: 1,
      price: 19,
      status: 'Processing',
      image: AppImages.productImage1,
      name: AppStringsOrder.itemName1,
      color: 'Grey',
      points: 12,
    ),
    OrderModel(
      id: '458750',
      date: '2025-08-01',
      tracking: 'TRK789123',
      quantity: 1,
      price: 29,
      status: 'Picking',
      image: AppImages.productImage2,
      name: AppStringsOrder.itemName1,
      color: 'Black',
      points: 15,
    ),
    OrderModel(
      id: '458751',
      date: '2025-08-02',
      tracking: 'TRK222111',
      quantity: 2,
      price: 39,
      status: 'Shipping',
      image: AppImages.productImage2,
      name: AppStringsOrder.itemName1,
      color: 'Black',
      points: 18,
    ),
    OrderModel(
      id: '458752',
      date: '2025-08-03',
      tracking: 'TRK333222',
      quantity: 1,
      price: 49,
      status: 'Processing',
      image: AppImages.productImage3,
      name: AppStringsOrder.itemName1,
      color: 'Green',
      points: 10,
    ),
    OrderModel(
      id: '458753',
      date: '2025-08-04',
      tracking: 'TRK444333',
      quantity: 1,
      price: 39,
      status: 'Delivered',
      image: AppImages.productImage1,
      name: AppStringsOrder.itemName1,
      color: 'Grey',
      points: 20,
    ),
  ];
});

// Current selected status
final selectedStatusProvider = StateProvider<String>((ref) => 'Processing');

// Filtered orders based on selected status
final ordersProvider = Provider<List<OrderModel>>((ref) {
  final allOrders = ref.watch(allOrdersProvider);
  final selectedStatus = ref.watch(selectedStatusProvider);
  return allOrders.where((o) => o.status == selectedStatus).toList();
});

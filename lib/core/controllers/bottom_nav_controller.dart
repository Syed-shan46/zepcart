import 'package:get/get.dart';
import 'package:zepcart/features/home/presentation/screens/home_screen.dart';
import 'package:zepcart/features/order/presentation/screens/my_orders_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/settings_screen.dart';
import 'package:zepcart/features/wishlist/presentation/screens/wishlist_screen.dart';

// A GetX controller managing the state and screen navigation of the bottom navigation bar.
// Tracks the selected tab index and provides the corresponding screen widgets for each tab.
class BottomNavController extends GetxController {
  // Singleton instance of the controller
  var selectedIndex = 0.obs;

  // List of screens to navigate between
  final screens = [
    HomeScreen(),
    WishlistScreen(),
    MyOrdersScreen(),
    const SettingsScreen(),
  ];

  // Method to change the selected tab index
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}

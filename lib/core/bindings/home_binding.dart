import 'package:get/get.dart';
import 'package:zepcart/core/controllers/bottom_nav_controller.dart';

// Binds and lazily initializes dependencies required for the Home module using GetX.
// Ensures BottomNavController is available and properly disposed based on usage.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Lazily puts BottomNavController into memory when it's needed.
    // It's disposed automatically when not used anymore.
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}

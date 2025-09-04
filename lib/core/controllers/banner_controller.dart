import 'package:get/get.dart';

// A GetX controller managing the state of a banner carousel slider by tracking the current page index.
// Provides a reactive variable to update UI elements like page indicators on page changes.
class BannerController extends GetxController {
  // Singleton access to this controller using Get.find()
  static BannerController get instance => Get.find();

  // Holds the current index of the carousel slider as an observable
  var carousalCurrentIndex = 0.obs;

  // Updates the current index value (called on page change)
  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }
}

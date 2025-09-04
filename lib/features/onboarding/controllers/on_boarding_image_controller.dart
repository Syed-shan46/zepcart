import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller for handling the onboarding logic like page navigation and indicators.
class OnBoardingController extends GetxController {
  // Provides access to the controller instance
  static OnBoardingController get instance => Get.find();

  // PageController to manage PageView scrolling
  final pageController = PageController();

  // Observable index to track the current onboarding page
  Rx<int> currentPageIndex = 0.obs;

  // Updates the page indicator when user scrolls the PageView
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Navigates to the selected page when a dot is clicked
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Jumps to the next page or navigates to another screen when last page is reached
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // Navigate to login or home screen after onboarding
      // Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Jumps to the previous page
  void prevPage() {
    int prevPage = currentPageIndex.value - 1;
    pageController.jumpToPage(prevPage);
  }

  // Skips directly to the last onboarding page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}

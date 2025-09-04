import 'package:get/get.dart';
import 'package:zepcart/core/bindings/home_binding.dart';
import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/features/cart/presentation/cart_screen.dart';
import 'package:zepcart/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:zepcart/features/authentication/presentation/screens/login_screen.dart';
import 'package:zepcart/features/authentication/presentation/screens/register_screen.dart';
import 'package:zepcart/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:zepcart/features/authentication/presentation/screens/forgot_password_verify_screen.dart';
import 'package:zepcart/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:zepcart/features/home/presentation/screens/home_screen.dart';
import 'package:zepcart/features/home/presentation/screens/offers_and_deals_screen.dart';
import 'package:zepcart/features/categories/presentation/screens/categories_screen.dart';
import 'package:zepcart/features/search/presentation/screens/search_result_screen.dart';
import 'package:zepcart/features/notification/presentation/screens/notification_screen.dart';
import 'package:zepcart/features/product_detail/presentation/screens/product_image_view_screen.dart';
import 'package:zepcart/features/product_review/presentation/screens/product_review_screen.dart';
import 'package:zepcart/features/product_review/presentation/screens/add_review_screen.dart';
import 'package:zepcart/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:zepcart/features/checkout/presentation/screens/checkout_flow_wrapper.dart';
import 'package:zepcart/features/checkout/presentation/screens/checkout_item_screen.dart';
import 'package:zepcart/features/checkout/presentation/screens/add_address_screen.dart';
import 'package:zepcart/features/checkout/presentation/screens/payment_screen.dart';
import 'package:zepcart/features/checkout/presentation/screens/add_credit_card_screen.dart';
import 'package:zepcart/features/order/presentation/screens/my_orders_screen.dart';
import 'package:zepcart/features/order/presentation/screens/order_details_screen.dart';
import 'package:zepcart/features/order/presentation/screens/order_success_screen.dart';
import 'package:zepcart/features/help/presentation/screens/help_screen.dart';
import 'package:zepcart/features/help/presentation/screens/ask_question_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/chat_support_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/edit_profile_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/change_password_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/saved_address_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/appearance_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/terms_and_conditions_screen.dart';
import 'package:zepcart/features/settings/presentation/screens/rate_us_screen.dart';
import 'package:zepcart/shared/widgets/navigation_bars/app_cupertino_nav_bar.dart';
import 'package:zepcart/shared/widgets/navigation_bars/app_custom_g_nav_bar.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    // Onboarding
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),

    // Navigation Bars
    GetPage(
      name: AppRoutes.googleBottomNav,
      page: () => const AppCustomGNavBar(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.cupertinoBottomNav,
      page: () => AppCupertinoBottomNav(),
      binding: HomeBinding(),
    ),

    // Authentication
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.otpVerification,
      page: () => const ForgotPasswordVerifyScreen(email: 'testing@gmail.com'),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),

    // Home, Categories & Search
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.offersAndDeals, page: () => OffersAndDealsScreen()),
    GetPage(name: AppRoutes.categoryGrid, page: () => CategoryListScreen()),
    GetPage(name: AppRoutes.searchResults, page: () => SearchResultsScreen()),
    GetPage(name: AppRoutes.notification, page: () => NotificationScreen()),

    // Product & Reviews
    GetPage(name: AppRoutes.productReview, page: () => ProductReviewScreen()),
    GetPage(name: AppRoutes.addReview, page: () => AddReviewScreen()),
    GetPage(
      name: AppRoutes.imageView,
      page: () => ProductImageViewScreen(
        imageUrls: [
          AppImages.productImage6,
          AppImages.productImage7,
          AppImages.productImage6,
          AppImages.productImage7,
        ],
      ),
    ),

    // Cart & Checkout
    GetPage(name: AppRoutes.cart, page: () => CartScreen()),
    GetPage(
      name: AppRoutes.checkout,
      page: () => CheckoutScreen(onNext: () {}),
    ),
    GetPage(
      name: AppRoutes.checkoutFlowWrapper,
      page: () => CheckoutFlowWrapper(),
    ),
    GetPage(name: AppRoutes.checkoutItems, page: () => CheckoutItemsScreen()),
    GetPage(name: AppRoutes.addAddress, page: () => AddAddressScreen()),
    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentScreen(onNext: () {}),
    ),
    GetPage(name: AppRoutes.addCard, page: () => AddCreditCardScreen()),

    // Orders
    GetPage(name: AppRoutes.myOrders, page: () => MyOrdersScreen()),
    GetPage(name: AppRoutes.orderDetails, page: () => OrderDetailsScreen()),
    GetPage(
      name: AppRoutes.orderSuccess,
      page: () => OrderConfirmationScreen(),
    ),

    // Help & Support
    GetPage(name: AppRoutes.help, page: () => HelpScreen()),
    GetPage(name: AppRoutes.askQuestion, page: () => AskQuestionScreen()),
    GetPage(name: AppRoutes.chatSupport, page: () => ChatSupportScreen()),

    // Settings & Profile
    GetPage(name: AppRoutes.editProfile, page: () => EditProfileScreen()),
    GetPage(name: AppRoutes.changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: AppRoutes.savedAddress, page: () => SavedAddressesScreen()),
    GetPage(name: AppRoutes.appearance, page: () => AppearanceScreen()),
    GetPage(name: AppRoutes.privacyPolicy, page: () => PrivacyPolicyScreen()),
    GetPage(
      name: AppRoutes.termsAndConditions,
      page: () => TermsAndConditionsScreen(),
    ),
    GetPage(name: AppRoutes.rateUs, page: () => RateUsScreen()),
  ];
}

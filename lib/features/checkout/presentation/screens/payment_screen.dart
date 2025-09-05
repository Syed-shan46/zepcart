import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/features/checkout/presentation/providers/checkout_provider.dart';
import 'package:zepcart/features/checkout/presentation/screens/add_credit_card_screen.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_items_header.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_payment_bottom_bar.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_payment_card.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_pickup_option_card.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final VoidCallback onNext; // Callback when user taps "Next" or proceeds
  const PaymentScreen({super.key, required this.onNext});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends ConsumerState<PaymentScreen> {
  int selectedPayment = 0; // 0 = credit card, 1 = COD
  bool selfPickup = true; // Toggle for pickup option

  @override
  Widget build(BuildContext context) {
    final checkoutState = ref.watch(checkoutProvider);

    return Scaffold(
      // Bottom bar with the payment summary and next button
      bottomNavigationBar: CheckoutPaymentBottomBar(
        widget: widget,
        finalPrice: checkoutState.total,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckoutItemsHeader(
                onTap: () => Get.to(() => AddCreditCardScreen()),
                title: AppStringsCheckout.addCreditCard,
              ),

              SizedBox(height: AppSizes.spacing.sm),

              // Credit Card Option Card
              CheckoutPaymentCard(
                context: context,
                title: AppStringsCheckout.creditCard,
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card Holder Details5
                    Text(
                      AppStringsCheckout.creditCardHolder,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(AppStringsCheckout.creditCardNumber),
                    Text(AppStringsCheckout.creditCardExpiry),
                    SizedBox(height: AppSizes.spacing.sm),

                    // Powered by Text + Image
                    Row(
                      children: [
                        Text(
                          AppStringsCheckout.poweredBy,
                          style: context.text.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                        Icon(Icons.paypal, size: AppSizes.font.md),
                      ],
                    ),
                  ],
                ),
                icon: Icons.credit_card,
                selected: selectedPayment == 0,
                onTap: () => setState(() => selectedPayment = 0),
              ),
              SizedBox(height: AppSizes.spacing.md),

              // Cash on Delivery Card
              CheckoutPaymentCard(
                context: context,
                title: AppStringsCheckout.cod,
                subtitle: Text(
                  AppStringsCheckout.codNote,
                  style: context.text.bodySmall?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
                icon: Icons.account_balance_wallet,
                selected: selectedPayment == 1,
                onTap: () => setState(() => selectedPayment = 1),
              ),
              SizedBox(height: AppSizes.spacing.lg),

              // Pickup Option Switch
              CheckoutPickupOptionCard(
                selfPickup: selfPickup,
                onToggle: (val) => setState(() => selfPickup = val),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

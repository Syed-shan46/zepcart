import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_address.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';
import 'package:zepcart/shared/widgets/overlays/app_snackbar.dart';

class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({super.key});

  @override
  State<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    );
    return Scaffold(
      appBar: PrimaryAppbar(title: AppStringsCheckout.addCreditCardTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Card Preview Widget
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              isHolderNameVisible: true,
              cardBgColor: Theme.of(context).colorScheme.primary,
              onCreditCardWidgetChange: (brand) {},
            ),
            const SizedBox(height: 16),

            // Updated Credit Card Form
            CreditCardForm(
              formKey: formKey,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: onCreditCardModelChange,
              obscureCvv: true,
              obscureNumber: false,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              enableCvv: true,

              // NEW: Input Configuration for Styling
              inputConfiguration: InputConfiguration(
                cardNumberDecoration: InputDecoration(
                  labelText: AppStringsAddress.cardNumberLabel,
                  hintText: AppStringsAddress.cardNumberHint,
                  border: borderStyle,
                ),
                expiryDateDecoration: InputDecoration(
                  labelText: AppStringsAddress.expiryDateLabel,
                  hintText: AppStringsAddress.expiryDateHint,
                  border: borderStyle,
                ),
                cvvCodeDecoration: InputDecoration(
                  labelText: AppStringsAddress.cvvLabel,
                  hintText: AppStringsAddress.cvvHint,
                  border: borderStyle,
                ),
                cardHolderDecoration: InputDecoration(
                  labelText: AppStringsAddress.cardHolderLabel,
                  hintText: AppStringsAddress.cardHolderHint,
                  border: borderStyle,
                ),
              ),
            ),
            SizedBox(height: AppSizes.spacing.lg),

            // Save Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
              child: AppPrimaryButton(
                text: AppStringsCheckout.saveCard,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.back();
                    AppSnackbar.success(
                      context,
                      AppStringsCheckout.cardAddedSuccess,
                    );
                  } else {
                    AppSnackbar.error(
                      context,
                      AppStringsCheckout.fillAllFields,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updates the card model values
  void onCreditCardModelChange(CreditCardModel model) {
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }
}

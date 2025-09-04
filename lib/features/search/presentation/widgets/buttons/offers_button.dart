import 'package:flutter/material.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';
import 'package:zepcart/features/search/presentation/widgets/buttons/search_action_button.dart';

// A Flutter widget displaying an "Offers" button for the search screen.
class OffersButton extends StatelessWidget {
  const OffersButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchActionButton(
      onPressed: () {},
      icon: Icons.local_offer,
      label: AppStringsSearch.offers,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';

// A custom AppBar widget containing a search text field with prefix and suffix icons.
// Includes microphone and QR code buttons and supports search submission handling.
class SearchInputBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Remove default leading (e.g., back button)
      automaticallyImplyLeading: false,

      // Align title to the full width
      titleSpacing: 0,

      // Main search bar
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
        child: SizedBox(
          height: 35.h, // Responsive height for search bar
          child: TextField(
            autofocus: true, // Automatically focus input on screen open

            decoration: InputDecoration(
              hintText: AppStringsSearch.hintText, // Localized placeholder
              // Search icon on the left
              prefixIcon: const Icon(Iconsax.search_favorite_1_copy),

              // Microphone and QR code buttons on the right
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.mic,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.qr_code_scanner,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),

              // Padding inside the input
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: AppSizes.padding.md,
              ),

              // Rounded filled background with no border
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.searchBarRadius),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.searchBarRadius),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.searchBarRadius),
                borderSide: BorderSide.none,
              ),
            ),

            // Callback when search is submitted
            onSubmitted: (query) {},
          ),
        ),
      ),
    );
  }

  // Required to implement PreferredSizeWidget
  // Controls AppBar height
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

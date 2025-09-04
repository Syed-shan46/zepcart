import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';
import 'package:zepcart/shared/widgets/overlays/app_bottom_sheet_handle.dart';
import 'package:zepcart/shared/widgets/input_fields/app_search_field.dart';

// Bottom sheet widget for selecting brands from a list
class BrandSelectionSheet extends StatefulWidget {
  final List<String> initialSelection;

  const BrandSelectionSheet({super.key, required this.initialSelection});

  @override
  State<BrandSelectionSheet> createState() => _BrandSelectionSheetState();
}

class _BrandSelectionSheetState extends State<BrandSelectionSheet> {
  // Controller for the brand search input field
  final TextEditingController _searchController = TextEditingController();

  // Map to track selected brands
  late Map<String, bool> _brands;

  // Full list of available brands
  final List<String> allBrands = [
    'Anastasia Beverly Hills',
    'Ardell',
    'Babor',
    'bareMinerals',
    'BBB London',
    'Birkenstock Cosmetics',
    'Bobbi Brown',
    'Ciaté',
    'Clinique',
    'Dr. Hauschka',
  ];

  @override
  void initState() {
    super.initState();

    // Initialize selection map using the initial selection list
    _brands = {for (var brand in allBrands) brand: widget.initialSelection.contains(brand)};
  }

  // Returns the list of brands filtered by the search query
  List<String> get filteredBrands {
    final query = _searchController.text.toLowerCase();
    return allBrands.where((brand) => brand.toLowerCase().contains(query)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final grouped = _groupByFirstLetter(filteredBrands);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder:
          (context, scrollController) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor, // or Colors.white
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                SizedBox(height: AppSizes.spacing.betweenItems),
                AppBottomSheetHandle(),
                // Top header with back button, title, and reset option
                _buildHeader(context),

                // Search input field
                _buildSearchField(context.isDarkMode),
                // Brand selection list grouped by first letter
                _buildBrandList(scrollController, grouped, context),

                // Apply button to return selected brands
                _buildApplyButton(context),
              ],
            ),
          ),
    );
  }

  Padding _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('All Brands'),
          TextButton(
            onPressed: () {
              setState(() {
                for (var key in _brands.keys) {
                  _brands[key] = false;
                }
              });
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  Padding _buildApplyButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.padding.md),
      child: SizedBox(
        width: double.infinity,
        height: 40.h,
        child: AppPrimaryButton(
          text: 'Apply',
          // Collect selected brands and return to caller
          onPressed: () {
            final selected = _brands.entries.where((e) => e.value).map((e) => e.key).toList();
            Navigator.pop(context, selected);
          },
          borderRadius: AppSizes.buttonRadius,
        ),
      ),
    );
  }

  // Builds the scrollable, grouped list of brand checkboxes
  Expanded _buildBrandList(
    ScrollController scrollController,
    Map<String, List<String>> grouped,
    BuildContext context,
  ) {
    return Expanded(
      child: ListView(
        controller: scrollController,
        children:
            grouped.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.padding.md,
                      vertical: AppSizes.padding.xs,
                    ),
                    child: Text(entry.key),
                  ),
                  ...entry.value.map((brand) {
                    return CheckboxListTile(
                      value: _brands[brand],
                      onChanged: (val) {
                        setState(() {
                          _brands[brand] = val!;
                        });
                      },
                      title: Text(brand, style: AppTextStyles.bodyMedium(context)),
                      contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.borderRadius.xs),
                      ),
                      side: const BorderSide(color: AppColors.grey, width: 1),
                    );
                  }),
                ],
              );
            }).toList(),
      ),
    );
  }

  // Groups brands by their first uppercase letter
  Map<String, List<String>> _groupByFirstLetter(List<String> brands) {
    final Map<String, List<String>> grouped = {};
    for (var brand in brands) {
      final first = brand[0].toUpperCase();
      grouped.putIfAbsent(first, () => []).add(brand);
    }
    return grouped;
  }

  // Builds the search field at the top of the sheet
  Widget _buildSearchField(bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
      child: SizedBox(height: 38.h, child: AppSearchField()),
    );
  }
}

// Flutter & third-party imports
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project-specific imports
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';
import 'package:zepcart/features/search/presentation/widgets/filter_sheet_header.dart';
import 'package:zepcart/features/search/presentation/widgets/search_section_header.dart';
import 'package:zepcart/features/search/presentation/widgets/sheets/brand_selection_sheet.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';
import 'package:zepcart/shared/widgets/overlays/app_bottom_sheet_handle.dart';

// Filter bottom sheet for advanced product filtering options
class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // Filter selections
  final List<String> _availableColors = ['Gray', 'Black', 'White', 'Teal'];
  final List<String> _selectedColors = [];

  final List<String> _availableBrands = ['Ardell', 'bareMinerals', 'Ciaté'];
  final List<String> _selectedBrands = [];

  final List<String> _availableCategories = [
    'Makeup',
    'Skincare',
    'Haircare',
    'Fragrance',
  ];
  final List<String> _selectedCategories = [];

  String? _selectedReview = '⭐️⭐️⭐️⭐️ & up';
  RangeValues _priceRange = const RangeValues(0, 234);

  // Switch & checkbox options
  bool _inStockOnly = false;
  bool _freeShipping = false;
  bool _fastDelivery = false;
  bool _newArrivals = false;
  bool _bestSellers = false;

  // Reset all filters to initial state
  void _resetFilters() {
    setState(() {
      _selectedColors.clear();
      _selectedBrands.clear();
      _selectedCategories.clear();
      _selectedReview = null;
      _priceRange = const RangeValues(0, 234);

      _inStockOnly = false;
      _freeShipping = false;
      _fastDelivery = false;
      _newArrivals = false;
      _bestSellers = false;
    });
  }

  // Opens brand selection modal and updates the selected brands
  void _openBrandSelectionSheet() async {
    final updatedBrands = await showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BrandSelectionSheet(initialSelection: _selectedBrands),
    );

    if (updatedBrands != null) {
      setState(() {
        _selectedBrands
          ..clear()
          ..addAll(updatedBrands);
      });
    }
  }

  // Builds individual review radio options
  Widget _buildReviewOption(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: _selectedReview,
      onChanged: (val) => setState(() => _selectedReview = val),
      title: Text(value),
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, scrollController) {
        return Stack(
          children: [
            // Scrollable filter content
            SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBottomSheetHandle(),

                  // Top header with Reset
                  FilterSheetHeader(onReset: _resetFilters),
                  SizedBox(height: AppSizes.defaultSpacing),

                  // Category section
                  SearchSectionHeader(
                    title: AppStringsSearch.categories,
                    trailing: AppStringsSearch.seeAll,
                    onTap: _openBrandSelectionSheet,
                  ),
                  _buildCategoryChips(context),
                  SizedBox(height: AppSizes.spacing.sm),

                  // Brand section
                  SearchSectionHeader(
                    title: AppStringsSearch.brands,
                    onTap: _openBrandSelectionSheet,
                    trailing: AppStringsSearch.seeAll,
                  ),
                  _buildBrandChips(context),
                  SizedBox(height: AppSizes.spacing.sm),

                  // Color section
                  SearchSectionHeader(title: AppStringsSearch.colors),
                  SizedBox(height: AppSizes.spacing.sm),
                  _buildColorChips(context.isDarkMode),
                  SizedBox(height: AppSizes.spacing.betweenItems),

                  // Price range section
                  SearchSectionHeader(title: AppStringsSearch.priceRange),
                  _buildRangeSlider(context),
                  Text(
                    '${_priceRange.start.toInt()}\$ - ${_priceRange.end.toInt()}\$',
                  ),
                  SizedBox(height: AppSizes.spacing.betweenItems),

                  // Review ratings
                  Column(
                    children: [
                      _buildReviewOption('⭐️⭐️⭐️⭐️ & up'),
                      _buildReviewOption('⭐️⭐️⭐️ & up'),
                      _buildReviewOption('⭐️⭐️ & up'),
                    ],
                  ),

                  // Switches & checkboxes
                  SwitchListTile(
                    title: Text(AppStringsSearch.inStock),
                    value: _inStockOnly,
                    onChanged: (val) => setState(() => _inStockOnly = val),
                  ),
                  ...[
                    _buildCheckBox(
                      AppStringsSearch.freeShipping,
                      _freeShipping,
                      (v) => _freeShipping = v,
                    ),
                    _buildCheckBox(
                      AppStringsSearch.fastDelivery,
                      _fastDelivery,
                      (v) => _fastDelivery = v,
                    ),
                    _buildCheckBox(
                      AppStringsSearch.newArrivals,
                      _newArrivals,
                      (v) => _newArrivals = v,
                    ),
                    _buildCheckBox(
                      AppStringsSearch.bestSellers,
                      _bestSellers,
                      (v) => _bestSellers = v,
                    ),
                  ],
                  SizedBox(height: AppSizes.spacing.betweenSections),
                ],
              ),
            ),

            // Apply button pinned to the bottom
            Positioned(
              left: AppSizes.spacing.md,
              right: AppSizes.spacing.md,
              bottom: AppSizes.spacing.md,
              child: SizedBox(
                height: 40.h,
                width: double.infinity,
                child: AppPrimaryButton(
                  borderRadius: AppSizes.buttonRadius,
                  text: AppStringsSearch.apply,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Helper to build checkbox list tile
  CheckboxListTile _buildCheckBox(
    String label,
    bool value,
    void Function(bool) update,
  ) {
    return CheckboxListTile(
      visualDensity: VisualDensity.compact,
      title: Text(label, style: context.text.bodyMedium),
      value: value,
      onChanged: (val) => setState(() => update(val!)),
    );
  }

  // Horizontal list of color chips
  SizedBox _buildColorChips(bool isDarkMode) {
    return SizedBox(
      height: 29.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            _availableColors.map((colorLabel) {
              return _buildColorOption(
                context: context,
                textColor: isDarkMode ? Colors.white : Colors.black,
                label: colorLabel,
                color: _getColorByName(colorLabel),
                selected: _selectedColors.contains(colorLabel),
                onTap: () {
                  setState(() {
                    _selectedColors.contains(colorLabel)
                        ? _selectedColors.remove(colorLabel)
                        : _selectedColors.add(colorLabel);
                  });
                },
              );
            }).toList(),
      ),
    );
  }

  // Category chips
  SingleChildScrollView _buildCategoryChips(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            _availableCategories.map((category) {
              final selected = _selectedCategories.contains(category);
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  selected: selected,
                  onSelected: (_) {
                    setState(() {
                      selected
                          ? _selectedCategories.remove(category)
                          : _selectedCategories.add(category);
                    });
                  },
                  label: Text(
                    category,
                    style: context.text.bodySmall?.copyWith(
                      color:
                          selected
                              ? AppColors.textWhite
                              : context.colors.onSurface,
                    ),
                  ),
                  showCheckmark: false,
                  side: BorderSide(
                    color: selected ? context.colors.primary : AppColors.grey,
                  ),
                  selectedColor: context.colors.primary,
                  backgroundColor: Colors.transparent,
                ),
              );
            }).toList(),
      ),
    );
  }

  // Brand chips (similar to category)
  Wrap _buildBrandChips(BuildContext context) {
    return Wrap(
      spacing: 8,
      children:
          _availableBrands.map((brand) {
            final selected = _selectedBrands.contains(brand);
            return FilterChip(
              selected: selected,
              onSelected: (_) {
                setState(() {
                  selected
                      ? _selectedBrands.remove(brand)
                      : _selectedBrands.add(brand);
                });
              },
              label: Text(
                brand,
                style: context.text.bodySmall?.copyWith(
                  color:
                      selected ? AppColors.textWhite : context.colors.onSurface,
                ),
              ),
              showCheckmark: false,
              side: BorderSide(
                color: selected ? context.colors.primary : AppColors.grey,
              ),
              selectedColor: context.colors.primary,
              backgroundColor: Colors.transparent,
            );
          }).toList(),
    );
  }

  // Price range slider UI
  SliderTheme _buildRangeSlider(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 1.9,
        rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.always,
      ),
      child: RangeSlider(
        values: _priceRange,
        min: 0,
        max: 500,
        divisions: 100,
        labels: RangeLabels(
          '${_priceRange.start.toInt()}\$',
          '${_priceRange.end.toInt()}\$',
        ),
        onChanged: (values) => setState(() => _priceRange = values),
      ),
    );
  }
}

// Builds a single color chip
Widget _buildColorOption({
  required String label,
  required Color color,
  required bool selected,
  required VoidCallback onTap,
  required Color textColor,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: AppSizes.spacing.sm),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color:
            selected
                ? context.colors.primary
                : context.isDarkMode
                ? Colors.grey.shade900
                : AppColors.grey200,
        border: Border.all(
          color: selected ? context.colors.primary : AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSizes.spacing.sm + AppOffsets.nudgeSM,
            height: AppSizes.spacing.sm + AppOffsets.nudgeSM,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grey),
            ),
          ),
          Text(
            label,
            style: context.text.bodySmall?.copyWith(
              color: selected ? AppColors.textWhite : context.colors.onSurface,
            ),
          ),
        ],
      ),
    ),
  );
}

// Returns a color from its string name
Color _getColorByName(String name) {
  switch (name.toLowerCase()) {
    case 'gray':
      return Colors.grey;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'teal':
      return Colors.teal;
    default:
      return Colors.transparent;
  }
}

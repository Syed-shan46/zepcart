import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A fullscreen image viewer screen for displaying product images
class ProductImageViewScreen extends StatefulWidget {
  final List<String> imageUrls;

  const ProductImageViewScreen({super.key, required this.imageUrls});

  @override
  State<ProductImageViewScreen> createState() => _ProductImageViewScreenState();
}

class _ProductImageViewScreenState extends State<ProductImageViewScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image carousel (Zoomable)
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              return InteractiveViewer(
                child: Center(
                  child: Image.network(
                    widget.imageUrls[index],
                    fit: BoxFit.contain,

                    errorBuilder:
                        (_, __, ___) => const Icon(
                          Icons.broken_image,
                          color: AppColors.white,
                        ),
                  ),
                ),
              );
            },
          ),

          // Close button
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Bottom dot indicator
          Positioned(
            bottom: AppSizes.spacing.lg,

            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imageUrls.length, (index) {
                final isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: AppSizes.spacing.xs),
                  height: 8,
                  width: isActive ? 20 : 8,
                  decoration: BoxDecoration(
                    color:
                        isActive
                            ? context.colors.primary
                            : context.colors.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/features/wishlist/domain/model/wishlist_model.dart';

// Sample wishlist data grouped by categories for testing wishlist features.
// Includes item details such as title, image, color, size, and price.
List<WishlistGroup> sampleWishlistGroups = [
  WishlistGroup(
    title: 'Electronics',
    items: [
      WishlistItem(
        title: 'Sleek Black Fitness Tracker Watch',
        imageUrl: AppImages.productImage4,
        color: 'Black',
        price: 49.00,
      ),

      WishlistItem(
        title: 'iPhone 11 Pro Max Silicone Case',
        imageUrl: AppImages.productImage2,

        color: 'Green',
        price: 15.90,
      ),
    ],
  ),

  WishlistGroup(
    title: 'Shoes',
    items: [
      WishlistItem(
        title: 'Nike Running Shoe Teal - (Premium)',
        imageUrl: AppImages.productImage11,
        size: '8',
        color: 'Teal',
        price: 99.98,
      ),
    ],
  ),

  WishlistGroup(
    title: 'Fashion',
    items: [
      WishlistItem(
        title: 'Midnight Navy Tailored Fit Blazer',
        imageUrl: AppImages.productImage6,
        color: 'Navy',
        price: 29.00,
      ),

      WishlistItem(
        title: 'White Tailored Fit Blazer',
        imageUrl: AppImages.productImage7,
        color: 'White',
        price: 34.00,
      ),
    ],
  ),
];

import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/features/product_review/domain/models/review_model.dart';

// Sample user reviews with comments, ratings, avatars, and timestamps for product review display.
// Provides diverse feedback for testing review listing features.
final List<ReviewModel> sampleReviews = [
  ReviewModel(
    user: 'Courtney Henry',
    comment:
        'Absolutely love the product quality! Fast delivery and packaging was top-notch. Will definitely order again.',
    avatarUrl: AppImages.userImage,
    rating: 5,
    timeAgo: '2 mins ago',
  ),

  ReviewModel(
    user: 'Cameron Williamson',
    comment:
        'The item was as described but the shipping took longer than expected. Overall, a good experience.',
    avatarUrl: AppImages.userImage,
    rating: 4,
    timeAgo: '10 mins ago',
  ),

  ReviewModel(
    user: 'Jane Cooper',
    comment:
        'Product quality is decent for the price. Would recommend for budget-conscious buyers.',
    avatarUrl: AppImages.userImage,
    rating: 3,
    timeAgo: '30 mins ago',
  ),

  ReviewModel(
    user: 'Jerome Bell',
    comment:
        'The packaging was damaged when I received it. Support team responded quickly and offered a replacement.',
    avatarUrl: AppImages.userImage,
    rating: 2,
    timeAgo: '1 hour ago',
  ),

  ReviewModel(
    user: 'Esther Howard',
    comment:
        'Unfortunately, the product didn’t match the description and felt lower quality. Had to return it.',
    avatarUrl: AppImages.userImage,
    rating: 1,
    timeAgo: '2 hours ago',
  ),
];

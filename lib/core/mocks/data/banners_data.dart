import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/features/home/domain/models/banner_model.dart';

// Sample banner data for homepage carousel or promotional displays.
// Includes example banners with images, titles, and subtitles.
final List<BannerModel> bannersData = [
  BannerModel(
    id: 1,
    image: AppImages.banner1,
    title: 'Summer Clearance Event',
    subTitle: 'Up to 70% off bestsellers — while supplies last!',
  ),

  BannerModel(
    id: 2,
    image: AppImages.banner1,
    title: 'Exclusive Online Deals',
    subTitle: 'Unlock member-only prices on your favorite brands.',
  ),

  BannerModel(
    id: 3,
    image: AppImages.banner1,
    title: 'Limited Time Flash Sale',
    subTitle: 'Deals drop daily. Don’t miss today’s top picks!',
  ),
];

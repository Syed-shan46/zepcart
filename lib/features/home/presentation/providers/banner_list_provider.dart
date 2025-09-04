import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/mocks/data/banners_data.dart';
import 'package:zepcart/features/home/domain/models/banner_model.dart';

final bannerListProvider = FutureProvider<List<BannerModel>>((ref) async {
  // Simulate async loading delay for lunged effect
  await Future.delayed(const Duration(seconds: 2));
  return bannersData;
});

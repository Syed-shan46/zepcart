class SubCategoryModel {
  final String title;
  final String imageUrl;

  const SubCategoryModel({required this.title, required this.imageUrl});
}

class CategoryModel {
  final String title;
  final String imageUrl;
  final List<SubCategoryModel> subCategories;

  const CategoryModel({
    required this.title,
    required this.imageUrl,
    this.subCategories = const [],
  });
}

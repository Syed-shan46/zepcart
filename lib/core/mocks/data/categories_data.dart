import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/features/categories/domain/models/category_model.dart';

const List<CategoryModel> categoryList = [
  CategoryModel(
    title: 'Electronics',
    imageUrl: AppImages.electronics,
    subCategories: [
      SubCategoryModel(title: 'Smartphones', imageUrl: AppImages.mobile),
      SubCategoryModel(title: 'Smartwatch', imageUrl: AppImages.smartwatch),
      SubCategoryModel(
        title: 'Laptop & Screens',
        imageUrl: AppImages.laptopScreen,
      ),
      SubCategoryModel(title: 'Tablet', imageUrl: AppImages.tablet),
      SubCategoryModel(title: 'Television', imageUrl: AppImages.television),
      SubCategoryModel(title: 'Camera', imageUrl: AppImages.camera),
      SubCategoryModel(title: 'Game Console', imageUrl: AppImages.gameConsole),
      SubCategoryModel(title: 'Headphones', imageUrl: AppImages.headPhone),
      SubCategoryModel(title: 'Drone', imageUrl: AppImages.drone),
    ],
  ),
  CategoryModel(
    title: 'Sports',
    imageUrl: AppImages.sports,
    subCategories: [
      SubCategoryModel(
        title: 'Badminton',
        imageUrl: AppImages.badmintonEquipment,
      ),
      SubCategoryModel(title: 'Cycling', imageUrl: AppImages.cycling),
      SubCategoryModel(title: 'Running Shoes', imageUrl: AppImages.runningShoe),
      SubCategoryModel(title: 'Gloves', imageUrl: AppImages.gloves),
      SubCategoryModel(title: 'Bike Helmet', imageUrl: AppImages.bikeHelmet),
    ],
  ),
  CategoryModel(
    title: 'Home',
    imageUrl: AppImages.home,
    subCategories: [
      SubCategoryModel(title: 'Bed', imageUrl: AppImages.bed),
      SubCategoryModel(title: 'Chair', imageUrl: AppImages.chair),
      SubCategoryModel(title: 'Sofa', imageUrl: AppImages.sofa),
      SubCategoryModel(title: 'Wardrobe', imageUrl: AppImages.wardrobe),
      SubCategoryModel(
        title: 'Home Appliances',
        imageUrl: AppImages.homeAppliance,
      ),
      SubCategoryModel(
        title: 'Improvement Tools',
        imageUrl: AppImages.improvement,
      ),
      SubCategoryModel(title: 'Tool Box', imageUrl: AppImages.toolBox),
    ],
  ),
  CategoryModel(
    title: 'Fashion',
    imageUrl: AppImages.fashion,
    subCategories: [
      SubCategoryModel(title: 'Baby Clothes', imageUrl: AppImages.babyCloths),
      SubCategoryModel(title: 'Sunglasses', imageUrl: AppImages.sunglasses),
      SubCategoryModel(title: 'School Bag', imageUrl: AppImages.schoolBag),
    ],
  ),
  CategoryModel(
    title: 'Groceries',
    imageUrl: AppImages.groceries,
    subCategories: [
      SubCategoryModel(title: 'Milk', imageUrl: AppImages.milk),
      SubCategoryModel(title: 'Fruits', imageUrl: AppImages.fruit),
      SubCategoryModel(title: 'Vegetables', imageUrl: AppImages.vegetables),
      SubCategoryModel(title: 'Food Items', imageUrl: AppImages.food),
      SubCategoryModel(title: 'Nachos & Snacks', imageUrl: AppImages.nachos),
    ],
  ),
  CategoryModel(
    title: 'Automotive',
    imageUrl: AppImages.automotive,
    subCategories: [
      SubCategoryModel(title: 'Tyres', imageUrl: AppImages.tyre),
      SubCategoryModel(title: 'Engine Oil', imageUrl: AppImages.engineOil),
      SubCategoryModel(
        title: 'Speedometer & Parts',
        imageUrl: AppImages.speedometer,
      ),
      SubCategoryModel(
        title: 'Improvement Tools',
        imageUrl: AppImages.improvement,
      ),
      SubCategoryModel(title: 'First Aid Kit', imageUrl: AppImages.first),
    ],
  ),
];

// Model representing a promotional banner with id, image, title, and subtitle.
class BannerModel {
  final int id;
  final String image;
  final String title;
  final String subTitle;

  const BannerModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

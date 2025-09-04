class ProductModel {
  final int id;
  final String title;
  final List<String> images;
  final double price;
  final String description;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.description,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    title: json['title'],
    images: List<String>.from(json['images'] ?? [json['image']]), //
    price: (json['price'] as num).toDouble(),
    description: json['description'],
    rating: Rating.fromJson(json['rating']),
  );
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(rate: (json['rate'] as num).toDouble(), count: json['count']);
}

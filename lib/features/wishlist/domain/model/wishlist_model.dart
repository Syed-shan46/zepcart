// Models representing groups of wishlist items and individual wishlist items with optional attributes.
class WishlistGroup {
  String title;
  List<WishlistItem> items;

  WishlistGroup({required this.title, required this.items});
}

class WishlistItem {
  String title;
  String imageUrl;
  String? size;
  String? color;
  String? ram;
  double price;

  WishlistItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    this.size,
    this.color,
    this.ram,
  });
}

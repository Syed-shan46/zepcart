class SavedCard {
  final String brand;
  final String masked;
  final String holder;
  final String expiry;
  final String last4;
  final bool isDefault;

  SavedCard({
    required this.brand,
    required this.masked,
    required this.holder,
    required this.expiry,
    required this.last4,
    required this.isDefault,
  });

  SavedCard copyWith({bool? isDefault}) => SavedCard(
    brand: brand,
    masked: masked,
    holder: holder,
    expiry: expiry,
    last4: last4,
    isDefault: isDefault ?? this.isDefault,
  );
}

// Model representing a user address with fields and a copyWith method for updates.
class AddressModel {
  final String type;
  final String name;
  final String phone;
  final String address;
  final String city;
  final bool isDefault;

  AddressModel({
    required this.type,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.isDefault,
  });

  // Returns a new AddressModel with optional updated fields
  AddressModel copyWith({
    String? type,
    String? name,
    String? phone,
    String? address,
    String? city,
    bool? isDefault,
  }) {
    return AddressModel(
      type: type ?? this.type,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}

import 'package:zepcart/features/checkout/domain/models/address_model.dart';

// Sample address data representing user saved addresses for checkout.
// Includes multiple address types with contact details and default selection.
final List<AddressModel> addresses = [
  AddressModel(
    type: 'Home',
    name: 'Muhammad Raza',
    phone: '+971-50-1234567',
    address: 'Room #1 - Ground Floor, Al Najoum Building, 24 B Street',
    city: 'Dubai',
    isDefault: true,
  ),

  AddressModel(
    type: 'Work',
    name: 'Ali Zafar',
    phone: '+971-55-9876543',
    address: 'Office 102, Blue Tower, Sheikh Zayed Road',
    city: 'Dubai',
    isDefault: false,
  ),
];

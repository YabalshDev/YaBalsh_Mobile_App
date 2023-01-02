// ignore_for_file: prefer_final_fields, unused_field

import '../../features/addresses/domain/entities/address.dart';

abstract class AddressService {
  List<Address> _addresses = [];

  Address _primaryAddress = const Address();

  Address get primaryAddress;

  List<Address> get addresses;
  void setAddresses(List<Address> addresses);
  void addAddress(Address address);
  void removeAddress(Address address);
  void setPrimaryAddress(Address address);
}

class AddressServiceImpl implements AddressService {
  @override
  List<Address> _addresses = [];

  @override
  Address _primaryAddress = const Address();

  @override
  Address get primaryAddress => _primaryAddress;

  @override
  List<Address> get addresses => _addresses;

  @override
  void setPrimaryAddress(Address address) => _primaryAddress = address;

  @override
  void setAddresses(List<Address> addresses) {
    _addresses = addresses;
  }

  @override
  void addAddress(Address address) => _addresses.add(address);
  @override
  void removeAddress(Address address) => _addresses.remove(address);
}

import '../../features/addresses/domain/entities/address.dart';

class AddressService {
  List<Address> _addresses = [];

  List<Address> get addresses => _addresses;

  void setAddresses(List<Address> addresses) {
    _addresses = addresses;
  }

  void addAddress(Address address) => _addresses.add(address);
  void removeAddress(Address address) => _addresses.remove(address);
}

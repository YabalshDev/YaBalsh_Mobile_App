import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/features/auth/domain/entities/customer.dart';

class UserService {
  final LocalStorageProvider localStorageProvider;

  Customer? _currentCustomer;
  String _token = '';

  Customer? get currentCustomer => _currentCustomer;
  String get token => _token;

  UserService({required this.localStorageProvider});

  void setToken(String value) {
    _token = value;
  }

  void setCurrentCustomer(Customer newCustomer) {
    _currentCustomer = newCustomer;
  }

  String getToken() {
    final data = localStorageProvider.getData(key: AppStrings.token);
    setToken(data);
    return data as String;
  }
}

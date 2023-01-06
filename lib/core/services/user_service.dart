// ignore_for_file: prefer_final_fields, unused_field

import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/auth/domain/entities/customer.dart';

abstract class UserService {
  Customer? _currentCustomer;
  String _token = '';
  Customer? get currentCustomer;
  String get token;

  void setToken(String value);
  void setCurrentCustomer(Customer newCustomer);
  String getToken();
}

class UserServiceImpl implements UserService {
  final LocalStorageProvider localStorageProvider;
  @override
  Customer? _currentCustomer;
  @override
  String _token = '';
  @override
  Customer? get currentCustomer => _currentCustomer;
  @override
  String get token => _token;

  UserServiceImpl({required this.localStorageProvider});
  @override
  void setToken(String value) {
    _token = value;
  }

  @override
  void setCurrentCustomer(Customer newCustomer) {
    _currentCustomer = newCustomer;
  }

  @override
  String getToken() {
    try {
      final data = localStorageProvider.getData(key: AppStrings.token);
      if (data != null) {
        setToken(data);
        return data as String;
      }
      return '';
    } on CacheException {
      return '';
    }
  }
}

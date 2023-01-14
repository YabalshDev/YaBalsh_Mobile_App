// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
  void getCurrentCustomer();
  void logout();
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

  void _saveCustomerToLocalStorage(Customer customer) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.customerKey)) {
        await Hive.openBox<Customer>(AppStrings.customerKey);
      }

      final box = Hive.box<Customer>(AppStrings.customerKey);

      box.put('customer', customer);
    } catch (err) {
      debugPrint('failed to save customer');
    }
  }

  Future<Customer> _getCustomerFromLocalStorage() async {
    try {
      if (!Hive.isBoxOpen(AppStrings.customerKey)) {
        await Hive.openBox<Customer>(AppStrings.customerKey);
      }

      final box = Hive.box<Customer>(AppStrings.customerKey);

      final customer = box.get('customer', defaultValue: const Customer());
      return customer!;
    } catch (err) {
      debugPrint('failed to get customer');
      return const Customer();
    }
  }

  @override
  void setToken(String value) {
    _token = value;
  }

  @override
  void setCurrentCustomer(Customer newCustomer) {
    _currentCustomer = newCustomer;
    _saveCustomerToLocalStorage(newCustomer);
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

  @override
  void logout() {
    localStorageProvider.deleteData(key: AppStrings.token);
  }

  @override
  void getCurrentCustomer() async {
    final customer = await _getCustomerFromLocalStorage();
    _currentCustomer = customer;
  }
}

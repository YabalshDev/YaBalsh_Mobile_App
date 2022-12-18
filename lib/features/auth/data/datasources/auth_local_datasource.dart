import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/core/services/user_service.dart';

abstract class AuthLocalDataSource {
  void setUserToken({required String token});
  bool checkUserLoggedIn();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalStorageProvider localStorageProvider;
  final UserService userService;

  AuthLocalDataSourceImpl(
      {required this.userService, required this.localStorageProvider});
  @override
  bool checkUserLoggedIn() {
    try {
      final response = localStorageProvider.getData(key: AppStrings.token);
      debugPrint(response);
      return true;
    } on CacheException {
      return false;
    }
  }

  @override
  void setUserToken({required String token}) {
    try {
      localStorageProvider.setData(key: AppStrings.token, data: token);
      userService.setToken(token);
    } on CacheException catch (err) {
      debugPrint(err.toString());
    }
  }
}

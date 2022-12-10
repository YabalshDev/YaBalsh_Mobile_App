import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';

abstract class AuthLocalDataSource {
  void setUserToken({required String token});
  bool checkUserLoggedIn();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalStorageProvider localStorageProvider;

  AuthLocalDataSourceImpl({required this.localStorageProvider});
  @override
  bool checkUserLoggedIn() {
    try {
      final response = localStorageProvider.getData(key: AppStrings.token);
      print(response);
      return true;
    } on CacheException {
      return false;
    }
  }

  @override
  void setUserToken({required String token}) {
    try {
      final response =
          localStorageProvider.setData(key: AppStrings.token, data: token);
    } on CacheException catch (err) {
      print(err);
    }
  }
}

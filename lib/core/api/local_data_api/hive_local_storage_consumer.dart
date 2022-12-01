import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';

class HiveLocalDataConsumer implements LocalStorageProvider {
  @override
  void deleteData({required key, id}) {
    try {
      final box = Hive.box(key);

      box.delete(key);
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  dynamic getData({required key, type}) {
    try {
      final box = Hive.box(key);

      return box.get(key)!;
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  void setData({required key, required data}) {
    try {
      final box = Hive.box(key);

      box.put(key, data);
    } catch (err) {
      throw CacheException();
    }
  }
}

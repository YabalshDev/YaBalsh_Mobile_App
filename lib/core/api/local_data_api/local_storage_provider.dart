abstract class LocalStorageProvider {
  dynamic getData({required dynamic key, dynamic type});
  void setData({required dynamic key, required dynamic data});
  void deleteData({required dynamic key, dynamic id});
}

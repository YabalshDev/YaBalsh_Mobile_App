// ignore_for_file: file_names

abstract class RestApiProvider {
  Future get(String path, {Map<String, dynamic>? queryParams});

  Future post(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? body});

  Future put(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? body});

  Future delete(String path, {Map<String, dynamic>? queryParams});
}

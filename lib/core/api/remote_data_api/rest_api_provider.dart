// ignore_for_file: file_names

abstract class RestApiProvider {
  Future get(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? headers});

  Future post(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers});

  Future put(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers});

  Future delete(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? headers});
}

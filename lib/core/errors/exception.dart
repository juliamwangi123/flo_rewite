class ServerException implements Exception {
  final String message;
  const ServerException(this.message);

  @override
  String toString() => 'ServerException: $message';
}

//error thrown when  getting the cached data
class CacheException implements Exception {}
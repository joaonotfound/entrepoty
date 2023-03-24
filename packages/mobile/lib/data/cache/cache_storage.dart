abstract class CacheStorage<T> {
  final String key;
  const CacheStorage({
    required this.key,
  });
  Future<T> save(T data);
  Future<T> load();
}

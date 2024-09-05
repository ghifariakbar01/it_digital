abstract class ItemStorage {
  Future<String?> read();

  Future<void> save(String credentials);

  Future<void> clear();
}

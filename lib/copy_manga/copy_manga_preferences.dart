import 'package:shared_preferences/shared_preferences.dart';

class CopyMangaPreferences {
  CopyMangaPreferences(this._preferences);

  static const _tokenKey = 'copy_manga.token';
  static const _deviceInfoKey = 'copy_manga.device_info';
  static const _deviceKey = 'copy_manga.device';
  static const _pseudoIdKey = 'copy_manga.pseudo_id';
  static const _apiHostKey = 'copy_manga.api_host';
  static const _regionKey = 'copy_manga.region';
  static const _imageQualityKey = 'copy_manga.image_quality';
  static const _searchModeKey = 'copy_manga.search_mode';
  static const _favoritesOrderingKey = 'copy_manga.favorites_ordering';

  final SharedPreferences _preferences;

  String? get token => _preferences.getString(_tokenKey);
  String get apiHost =>
      _preferences.getString(_apiHostKey) ?? 'api.copy2000.online';
  String get region => _preferences.getString(_regionKey) ?? '0';
  String get imageQuality => _preferences.getString(_imageQualityKey) ?? '1500';
  String get searchMode => _preferences.getString(_searchModeKey) ?? 'baseAPI';
  String get favoritesOrdering =>
      _preferences.getString(_favoritesOrderingKey) ?? '-datetime_updated';

  Future<void> setToken(String value) =>
      _preferences.setString(_tokenKey, value);
  Future<void> clearToken() => _preferences.remove(_tokenKey);
  Future<void> setApiHost(String value) =>
      _preferences.setString(_apiHostKey, value);
  Future<void> setRegion(String value) =>
      _preferences.setString(_regionKey, value);
  Future<void> setImageQuality(String value) =>
      _preferences.setString(_imageQualityKey, value);
  Future<void> setSearchMode(String value) =>
      _preferences.setString(_searchModeKey, value);
  Future<void> setFavoritesOrdering(String value) =>
      _preferences.setString(_favoritesOrderingKey, value);

  String getOrCreateDeviceInfo() => _getOrCreate(
    _deviceInfoKey,
    () => '${_randomInt(1000000, 9999999)}V-${_randomInt(1000, 9999)}',
  );

  String getOrCreateDevice() => _getOrCreate(_deviceKey, () {
    String letter() => String.fromCharCode(65 + _randomInt(0, 25));
    String digit() => String.fromCharCode(48 + _randomInt(0, 9));
    return '${letter()}${letter()}${digit()}${letter()}.'
        '${digit()}${digit()}${digit()}${digit()}${digit()}${digit()}.'
        '${digit()}${digit()}${digit()}';
  });

  String getOrCreatePseudoId() => _getOrCreate(_pseudoIdKey, () {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(
      16,
      (_) => chars[_randomInt(0, chars.length - 1)],
    ).join();
  });

  Future<void> clearDeviceIdentity() async {
    await Future.wait([
      _preferences.remove(_deviceInfoKey),
      _preferences.remove(_deviceKey),
      _preferences.remove(_pseudoIdKey),
    ]);
  }

  String _getOrCreate(String key, String Function() create) {
    final existing = _preferences.getString(key);
    if (existing != null && existing.isNotEmpty) return existing;
    final value = create();
    _preferences.setString(key, value);
    return value;
  }
}

int _randomInt(int min, int max) {
  final value = DateTime.now().microsecondsSinceEpoch;
  return min + (value ^ (value >> 11) ^ (value >> 23)).abs() % (max - min + 1);
}

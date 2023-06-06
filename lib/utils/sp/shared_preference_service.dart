import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  late SharedPreferences _prefs;
  final String _verificationToken = 'verificationToken';
  final String _authToken = 'authToken';
  final String _craverId = 'craverId';
  final String _recentSearches = 'recentSearches';
  final String _loggedInUser = 'loggedInUser';

  SharedPreferenceService(this._prefs);

  static final SharedPreferenceService _preferenceService =
      SharedPreferenceService._();
  SharedPreferenceService._();
  static SharedPreferenceService instance() {
    return _preferenceService;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<bool> setVerificationToken(String value) async {
    return await setString(_verificationToken, value);
  }

  String? getVerificationToken() {
    return getString(_verificationToken);
  }

  Future<bool> setAuthToken(String value) async {
    return await setString(_authToken, value);
  }

  String? getAuthToken() {
    return getString(_authToken);
  }

  Future<bool> setCraverId(String value) async {
    return await setString(_craverId, value);
  }

  String? getCraverId() {
    return getString(_craverId);
  }

  Future<bool> setLoggedInUser(bool value) async {
    return await setBool(_loggedInUser, value);
  }

  bool getLoggedInUser() {
    return getBool(_loggedInUser) ?? true;
  }

  Future<bool> setRecentSearches(String value) async {
    List<String>? searches = getRecentSearches();
    searches ??= [];
    if (searches.length >= 10) {
      searches.length = 10;
    }
    if (searches.contains(value)) {
      searches.remove(value);
    }
    searches.insert(0, value);
    return await _prefs.setStringList(_recentSearches, searches);
  }

  List<String>? getRecentSearches() {
    return _prefs.getStringList(_recentSearches);
  }

  Future<void> clearData() async {
    await _prefs.clear();
  }
}

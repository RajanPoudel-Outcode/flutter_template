import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_service.dart';

@Singleton(as: LocalStorageService)
class SecuredStorageService implements LocalStorageService {
  SecuredStorageService() {
    init();
  }

  late final FlutterSecureStorage _pref;

  @override
  String accessTokenKey = 'accessTokenKey';

  @override
  String refreshTokenKey = 'refreshTokenKey';

  @override
  String deviceIdKey = 'deviceIdKey';

  @override
  String userIdKey = 'userIdKey';

  @override
  String cartIdKey = 'cartIdKey';

  @override
  String membershipCartIdKey = 'membershipCartIdKey';

  @override
  String phoneNumberKey = 'phoneNumberKey';

  @override
  String locationIdKey = 'locationIdKey';

  @override
  String isGuestUserKey = 'isGuestUserKey';

  @override
  String saveLocationKey = 'saveLocationKey';

  @override
  String saveMembershipLocationKey = 'saveMembershipLocationKey';

  @override
  Future<String?> get accessToken => _pref.read(key: accessTokenKey);

  @override
  Future<String?> getValue({required String key}) {
    return _pref.read(key: key);
  }

  @override
  FutureOr<void> init() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    _pref = const FlutterSecureStorage();
    if (sharedPrefs.getBool('is_first_app_launch') ?? true) {
      await _pref.deleteAll();
      await sharedPrefs.setBool('is_first_app_launch', false);
    }
  }

  @override
  Future<String?> get refreshToken => _pref.read(key: refreshTokenKey);

  @override
  Future<void> setAccessToken(String? accessToken) async {
    return _pref.write(key: accessTokenKey, value: accessToken);
  }

  @override
  Future<void> setRefreshToken(String? refreshToken) async {
    return _pref.write(key: refreshTokenKey, value: refreshToken);
  }

  @override
  Future<void> setValue({required String key, required value}) async {
    await _pref.write(key: key, value: value);
  }

  @override
  Future<void> clearLocalCache() async {
    await setAccessToken(null);
    await setUserId(null);
    await setIsGuestUser(null);
    await setRefreshToken(null);
    await setDeviceId(null);
    return Future.value();
  }

  @override
  Future<String?> get deviceId => _pref.read(key: deviceIdKey);

  @override
  Future<void> setDeviceId(String? deviceId) {
    return _pref.write(key: deviceIdKey, value: deviceId);
  }

  @override
  Future<void> setUserId(String? userId) async {
    return _pref.write(key: userIdKey, value: userId);
  }

  @override
  Future<void> setIsGuestUser(String? isGuestUser) async {
    return _pref.write(key: isGuestUserKey, value: isGuestUser);
  }

  @override
  Future<String?> get isGuestUser => _pref.read(key: isGuestUserKey);

  @override
  Future<String?> get userId => _pref.read(key: userIdKey);

  @override
  Future<void> setCartId(String? cartId) {
    return _pref.write(key: cartIdKey, value: cartId);
  }

  @override
  Future<String?> get cartId => _pref.read(key: cartIdKey);

  @override
  Future<void> setPhoneNumber(String? phoneNumber) {
    return _pref.write(key: 'phoneNumberKey', value: phoneNumber);
  }

  @override
  Future<String?> get phoneNumber => _pref.read(key: phoneNumberKey);

  @override
  Future<String?> get locationId => _pref.read(key: locationIdKey);

  @override
  Future<void> setLocation(String? locationId) {
    return _pref.write(key: locationIdKey, value: locationId);
  }

  @override
  Future<String?> get cartMembershipId => _pref.read(key: membershipCartIdKey);

  @override
  Future<void> setMembershipCartId(String? cartId) {
    return _pref.write(key: membershipCartIdKey, value: cartId);
  }

  @override
  String saveCartOfferKey = 'saveCartOfferKey';

  @override
  Future<String?> get cartOfferCode => _pref.read(key: saveCartOfferKey);

  @override
  Future<void> clearCartOfferCode() {
    return _pref.delete(key: saveCartOfferKey);
  }

  @override
  Future<void> setCartOfferCode(String? cartOfferCode) {
    return _pref.write(key: saveCartOfferKey, value: cartOfferCode);
  }

  @override
  String isFirstTimeUserKey = 'isFirstTimeUserKey';

  @override
  String accountCreditAmountKey = 'accountCreditAmountKey';

  @override
  Future<String?> get isFirstTimeUser => _pref.read(key: isFirstTimeUserKey);

  @override
  Future<void> setFirstTimeUser(String? isFirstTimeUser) {
    return _pref.write(key: isFirstTimeUserKey, value: isFirstTimeUser);
  }

  @override
  Future<String?> get accountCreditAmount => _pref.read(key: accountCreditAmountKey);

  @override
  Future<void> saveAccountCreditAmount(String? creditAmount) {
    return _pref.write(key: accountCreditAmountKey, value: creditAmount);
  }

  // Impersonate Mode
  @override
  String isImpersonateModeKey = 'isImpersonateModeKey';

  @override
  Future<String?> get isImpersonateMode => _pref.read(key: isImpersonateModeKey);

  @override
  Future<void> setImpersonateMode(String? isImpersonateMode) {
    return _pref.write(key: isImpersonateModeKey, value: isImpersonateMode);
  }
}

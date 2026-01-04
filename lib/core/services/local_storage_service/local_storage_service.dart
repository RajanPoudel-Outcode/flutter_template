import 'dart:async';

abstract class LocalStorageService {
  String refreshTokenKey = '';

  String deviceIdKey = '';

  String userIdKey = '';
  String accessTokenKey = '';
  String cartIdKey = '';
  String membershipCartIdKey = '';
  String phoneNumberKey = '';
  String locationIdKey = '';

  String isGuestUserKey = '';

  String saveLocationKey = '';
  String saveMembershipLocationKey = '';

  String saveCartOfferKey = '';
  String isFirstTimeUserKey = '';
  String accountCreditAmountKey = '';

  String isImpersonateModeKey = '';

  FutureOr<void> init();

  Future<String?> get refreshToken;
  Future<String?> get deviceId;

  Future<String?> get accessToken;
  Future<String?> get userId;

  Future<String?> get cartId;
  Future<String?> get cartMembershipId;
  Future<String?> get phoneNumber;
  Future<String?> get locationId;
  Future<String?> get isGuestUser;
  Future<String?> get cartOfferCode;
  Future<String?> get isFirstTimeUser;
  Future<String?> get isImpersonateMode;
  Future<String?> get accountCreditAmount;

  Future<void> setCartId(String? cartId);
  Future<void> setMembershipCartId(String? cartId);
  Future<void> setLocation(String? locationId);
  Future<void> setPhoneNumber(String? phoneNumber);

  Future<void> setRefreshToken(String? refreshToken);
  Future<void> setDeviceId(String? deviceId);

  Future<void> setAccessToken(String? accessToken);
  Future<void> setUserId(String? userId);

  Future<void> setIsGuestUser(String? isGuestUser);
  Future<void> setCartOfferCode(String? cartOfferCode);
  Future<void> clearCartOfferCode();

  Future<void> setFirstTimeUser(String? isFirstTimeUser);
  Future<void> saveAccountCreditAmount(String? creditAmount);

  Future<void> setImpersonateMode(String? isImpersonateMode);

  Future<void> clearLocalCache();

  void setValue({required String key, required dynamic value});
  dynamic getValue({required String key});
}

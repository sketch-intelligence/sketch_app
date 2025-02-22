import 'package:hive_flutter/hive_flutter.dart';
import 'package:sketch/core/constant/end_points/cashe_helper_constant.dart';
import 'package:sketch/features/auth/data/model/login_model/authority.dart';
import 'package:sketch/features/auth/data/model/login_model/login_model.dart';
import 'package:sketch/features/auth/data/model/login_model/role.dart';
import 'package:sketch/features/auth/data/model/login_model/user.dart';
import 'package:sketch/features/profile/data/models/profile_model/follower.dart';
import 'package:sketch/features/profile/data/models/profile_model/following.dart';
import 'package:sketch/features/profile/data/models/profile_model/profile_model.dart';

class CacheHelper {
  static late Box<dynamic> box;

  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LoginModelAdapter());
    Hive.registerAdapter(UserAdapter()); // Register the User adapter
    Hive.registerAdapter(RoleAdapter()); // Register the Role adapter
    Hive.registerAdapter(AuthorityAdapter()); // Register the Authority adapter
    Hive.registerAdapter(ProfileModelAdapter());
    Hive.registerAdapter(FollowerAdapter());
    Hive.registerAdapter(FollowingAdapter());
    box = await Hive.openBox("default_box");
  }

  static Future<void> setLang(String value) => box.put(languageValue, value);
  static Future<void> setToken(String? value) =>
      box.put(accessToken, value ?? '');
  static Future<void> setBalance(dynamic value) =>
      box.put(balanceKey, value ?? '');
  static Future<void> setUserId(int? value) => box.put(userId, value ?? 0);
  static Future<void> setFirstTime(bool value) => box.put(isFirstTime, value);

  static String get lang => box.get(languageValue) ?? 'en';
  static String? get token {
    if (!box.containsKey(accessToken)) return null;
    return "${box.get(accessToken)}";
  }

  static Future<void> setIsUser(bool? value) =>
      box.put('is_user', value ?? false);

  // ✅ Get Firebase UID
  static bool? get isUser => box.get('is_user');

// ✅ Set Firebase UID
  static Future<void> setFirebaseUid(String? value) =>
      box.put('firebase_uid', value ?? '');

  // ✅ Get Firebase UID
  static String? get firebaseUid => box.get('firebase_uid');

  // ✅ Set Profile Image URL
  static Future<void> setProfileImageUrl(String? value) =>
      box.put('profile_image_url', value ?? '');

  // ✅ Get Profile Image URL
  static String? get profileImageUrl => box.get('profile_image_url');

  static Future<void> setCoverImageUrl(String? value) =>
      box.put('cover_image_url', value ?? '');

  // ✅ Get Profile Image URL
  static String? get profileCoverUrl => box.get('cover_image_url');

  static dynamic get balance {
    if (!box.containsKey(balanceKey)) return null;
    return box.get(balanceKey);
  }

  static bool get firstTime => box.get(isFirstTime) ?? true;
  static int? get userID => box.get(userId);

  static Future<void> setUserInfo(LoginModel? value) =>
      box.put(userModel, value);

  static LoginModel? get userInfo {
    if (!box.containsKey(userModel)) return null;
    return box.get(userModel);
  }

  static void deleteCertificates() {
    setToken(null);
    setUserId(null);
    setIsUser(null);
    setUserInfo(null);
    setBalance(null);
    setProfileImageUrl(null);
    setCoverImageUrl(null);
    setFirebaseUid(null);
  }
}

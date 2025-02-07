import 'package:hive_flutter/hive_flutter.dart';
import 'package:sketch/core/constant/end_points/cashe_helper_constant.dart';
import 'package:sketch/features/auth/data/model/login_model/authority.dart';
import 'package:sketch/features/auth/data/model/login_model/login_model.dart';
import 'package:sketch/features/auth/data/model/login_model/role.dart';
import 'package:sketch/features/auth/data/model/login_model/user.dart';

class CacheHelper {
  static late Box<dynamic> box;

  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LoginModelAdapter());
    Hive.registerAdapter(UserAdapter()); // Register the User adapter
    Hive.registerAdapter(RoleAdapter()); // Register the Role adapter
    Hive.registerAdapter(AuthorityAdapter()); // Register the Authority adapter
    box = await Hive.openBox("default_box");
  }

  static Future<void> setLang(String value) => box.put(languageValue, value);
  static Future<void> setToken(String? value) =>
      box.put(accessToken, value ?? '');
  static Future<void> setBalance(double? value) =>
      box.put(balanceKey, value ?? '');
  static Future<void> setUserId(int? value) => box.put(userId, value ?? 0);
  static Future<void> setFirstTime(bool value) => box.put(isFirstTime, value);

  static String get lang => box.get(languageValue) ?? 'en';
  static String? get token {
    if (!box.containsKey(accessToken)) return null;
    return "${box.get(accessToken)}";
  }

  static double? get balance {
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
    setUserInfo(null);
    setBalance(null);
  }
}

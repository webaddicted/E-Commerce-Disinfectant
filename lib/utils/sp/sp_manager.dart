import 'package:rallis/data/common/user_info.dart';
import 'package:rallis/utils/constant/pref_const.dart';
import 'package:rallis/utils/sp/sp_helper.dart';

class SPManager {
  static void setUserInfo<T>(UserIno user) async {
    SPHelper.setPreference(
        PrefConst.prefCustomerId, user.customerId.toString());
    SPHelper.setPreference(PrefConst.prefName, user.name);
    SPHelper.setPreference(PrefConst.prefEmail, user.email);
    SPHelper.setPreference(PrefConst.prefDob, user.dob);
    SPHelper.setPreference(PrefConst.prefMobile, user.mobile);
    SPHelper.setPreference(PrefConst.prefAddress, user.address);
    SPHelper.setPreference(PrefConst.prefImage, user.customerImage);
  }

  static Future<UserIno> getUserInfo<T>() async {
    var customerId = await SPHelper.getPreference(PrefConst.prefCustomerId, "");
    var name = await SPHelper.getPreference(PrefConst.prefName, "");
    var email = await SPHelper.getPreference(PrefConst.prefEmail, "");
    var dob = await SPHelper.getPreference(PrefConst.prefDob, "");
    var mobile = await SPHelper.getPreference(PrefConst.prefMobile, "");
    var address = await SPHelper.getPreference(PrefConst.prefAddress, "");
    var image = await SPHelper.getPreference(PrefConst.prefImage, "");
    var userInfo =
        UserIno(customerId, name, email, dob, mobile, address, image, '', '');
    return userInfo;
  }

  static Future<String> getCustomerId<T>() async {
    var spValue = await SPHelper.getPreference(PrefConst.prefCustomerId, "");
    return spValue;
  }

  static void setAccessToken<T>(String token) {
    SPHelper.setPreference(PrefConst.prefAccessToken, token);
  }

  static Future<String> getAccessToken<T>() async {
    var spValue = await SPHelper.getPreference(PrefConst.prefAccessToken, "");
    return spValue;
  }

  static Future<Set<String>> getAllKeys() async {
    var spValue = await SPHelper.getAllKeys();
    return spValue;
  }

  static Future<bool> removeKeys(String key) async {
    var spValue = await SPHelper.removeKey(key);
    return spValue;
  }

  static Future<bool> clearPref() async {
    var spValue = await SPHelper.clearPreference();
    return spValue;
  }
}

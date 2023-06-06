import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rallis/utils/apiutils/api_response.dart';
import 'package:rallis/utils/sp/sp_manager.dart';
import 'package:intl/intl.dart';
//  {START PAGE NAVIGATION}
void navigationPush(BuildContext context, StatefulWidget route) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return route;
    },
  ));
}

void navigationRemoveAllPush(BuildContext context, StatefulWidget route) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => route,
    ),
    (route) => false,
  );
}

void navigationPop(BuildContext context, StatefulWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPush(BuildContext context, StatelessWidget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPop(BuildContext context, StatelessWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

//  {END PAGE NAVIGATION}
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
// HexColor("#D26661").withOpacity(0.1);
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    if (hexColor.isEmpty) hexColor = "323483";
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


logout() {
  SPManager.clearPref();
  // navigationRemoveAllPush(ctx, LoginPage());
}
delay({double durationSec = 1, required Function click}){
  int sec =  (durationSec*1000).toInt();
  Future.delayed(Duration(milliseconds: sec), () {
    click();
  });
}
String getddMMMMyyyy(DateTime dateTime) {
  return DateFormat('dd-MMMM-yyyy').format(dateTime);
}

String getddMMyyyy(DateTime dateTime) {
  return DateFormat('dd-MM-yyyy').format(dateTime);
}

final logger = Logger();
printLog({String tag = "", required String msg, ApiStatus status = ApiStatus.success}){
  if (kDebugMode) {
    print("$tag : $msg");
    if(status ==ApiStatus.error) {
      logger.e("$tag : $msg");
    }else{
      logger.d("$tag : $msg");
    }
  }
}



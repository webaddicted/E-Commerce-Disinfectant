import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/api_constant.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/string_const.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              getAppBarWithBackBtn(title: StringConst.profile),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
                child: Column(
                  children: <Widget>[
                    getCacheImage(
                        url: ApiConstant.demoImg,
                        isCircle: true,
                        height: 100,
                        width: 100),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: getTxtAppColor(
                          msg: 'Deepak Sharma',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: ColorConst.appColor,
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: const Offset(0, 1))
                          ]),
                      height: 150,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            getColumnItem('Wallet', FontAwesomeIcons.wallet),
                            getColumnItem(
                                'Shipped', FontAwesomeIcons.hourglassEnd),
                            getColumnItem(
                                'Payment', FontAwesomeIcons.cartArrowDown),
                            getColumnItem('Support', FontAwesomeIcons.medapps),
                          ],
                        ),
                      ),
                    ),
                    getListItem(
                        'Settings', 'Privacy and logout', Icons.settings),
                    const Divider(),
                    getListItem(
                        'Help & Support',
                        'Help center and legal support',
                        Icons.help_outline_outlined),
                    const Divider(),
                    getListItem('FAQ', 'Questions and Answer',
                        Icons.question_answer_rounded),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getListItem(String title, String subTitle, IconData icon) {
    return ListTile(
        title: getTxtBlackColor(msg: title),
        subtitle: getTxtBlackColor(msg: subTitle),
        leading: Icon(icon, size: 30, color: ColorConst.appColor),
        trailing: Icon(
          Icons.chevron_right,
          color: ColorConst.appColor,
        ),
        onTap: () {});
  }

  Widget getColumnItem(String title, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(icon: Icon(icon), onPressed: () {}),
        getTxtBlackColor(msg: title, fontWeight: FontWeight.bold)
      ],
    );
  }
}

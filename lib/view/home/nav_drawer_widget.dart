import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/api_constant.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/routers_const.dart';

class NavDrawerWidget extends GetView<HomeController> {
  const NavDrawerWidget({Key? key}) : super(key: key);

  // final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    // _homeController.getUserInfo();
    return _buildDrawer();
  }

  _buildDrawer() {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: const BoxDecoration(
            color: ColorConst.whiteColor,
            boxShadow: [BoxShadow(color: Colors.black45)]),
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutersConst.profile);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getCacheImage(
                              url: ApiConstant.demoImg,
                              isCircle: true,
                              height: 80,
                              width: 80),
                          const SizedBox(height: 10.0),
                          getTxtBlackColor(
                              msg:
                                  "Deepak Sharma\ndeepaksharma040695@gmail.com",
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Get.back(),
                        )),
                  ],
                ),
                const SizedBox(height: 30.0),
                _buildRow(Icons.home, "Home"),
                // _buildDivider(),
                // _buildRow(Icons.category, "Category"),
                _buildDivider(),
                _buildRow(Icons.category, "Category", showBadge: true),
                _buildDivider(),
                _buildRow(Icons.shopping_cart_rounded, "Cart"),
                _buildDivider(),
                _buildRow(Icons.history_edu_outlined, "Order History"),
                _buildDivider(),
                _buildRow(Icons.file_copy_rounded, "Manage Address"),
                _buildDivider(),
                _buildRow(Icons.account_balance_wallet_outlined, "My Wallet",
                    showBadge: false),
                _buildDivider(),
                _buildRow(FontAwesomeIcons.commentMedical, "Complaints"),
                _buildDivider(),
                _buildRow(FontAwesomeIcons.suitcaseRolling, "Survey"),
                _buildDivider(),
                _buildRow(Icons.person_pin, "Profile"),
                _buildDivider(),
                _buildRow(Icons.notifications, "Notification"),
                _buildDivider(),
                _buildRow(Icons.settings, "Settings"),
                _buildDivider(),
                _buildRow(Icons.policy_rounded, "Policy"),
                _buildDivider(),
                _buildRow(Icons.info_outline, "About us"),
                _buildDivider(),
                _buildRow(Icons.exit_to_app, "Exit"),
                _buildDivider(),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return const Divider(color: ColorConst.greyColor);
  }

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () => _navigateOnNextScreen(title),
        child: Row(children: [
          Icon(
            icon,
            color: ColorConst.appColor,
          ),
          const SizedBox(width: 10.0),
          getTxtColor(
              msg: title,
              txtColor: ColorConst.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
          const Spacer(),
          if (showBadge)
            Material(
              color: ColorConst.appColor,
              elevation: 2.0,
              // shadowColor: ColorConst.APP_COLOR,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 10,
                height: 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConst.appColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                // child: Text(
                //   "10+",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 12.0,
                //       fontWeight: FontWeight.bold),
                // ),
              ),
            )
        ]),
      ),
    );
  }

  void _navigateOnNextScreen(String title) {
    Get.back();
    switch (title) {
      case "Home":
        // Get.offAllNamed(RoutersConst.home);
        // navigationRemoveAllPush(Get.context, HomeLandingPage());
        break;
      case "Category":
        Get.toNamed(RoutersConst.category);
        break;
      case "Cart":
        Get.toNamed(RoutersConst.cart);
        break;
      case "Order History":
        Get.toNamed(RoutersConst.orderHistory);
        break;
      case "Manage Address":
        Get.toNamed(RoutersConst.address);
        break;
      case "My Wallet":
        Get.toNamed(RoutersConst.wallet);
        break;
      case "Complaints":
        Get.toNamed(RoutersConst.complaints);
        break;
      case "Survey":
        Get.toNamed(RoutersConst.survey);
        break;
      case "Profile":
        Get.toNamed(RoutersConst.profile);
        break;
      case "Notification":
        Get.toNamed(RoutersConst.notification);
        break;
      case "Settings":
        Get.toNamed(RoutersConst.profile);
        break;
      case "Policy":
        Get.toNamed(RoutersConst.policy);
        break;
      case "About us":
        Get.toNamed(RoutersConst.aboutUs);
        break;
      case "Exit":
        onWillPop();
        break;
    }
  }
}

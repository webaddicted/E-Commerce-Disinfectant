import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rallis/utils/common/global_utilities.dart';
import 'package:rallis/utils/constant/assets_const.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/routers_const.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    animation.addListener(() => setState(() {}));
    animationController.forward();
    // var userInfo = await SPManager.getCustomerId();
    delay(
        durationSec: 5,
        click: () {
          // Get.offAllNamed(RoutersConst.home);
          Get.offAllNamed(RoutersConst.onboardPage);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: animation.value * 250,
                  height: animation.value * 250, //Adapt.px(500),
                  child: Image.asset(AssetsConst.logoImg)),
              const SizedBox(height: 180),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorConst.appColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

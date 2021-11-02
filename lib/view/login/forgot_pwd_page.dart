import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rallis/utils/common/validation_helper.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/assets_const.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/utils/constant/string_const.dart';

class ForgotPwdPage extends StatefulWidget {
  const ForgotPwdPage({Key? key}) : super(key: key);

  @override
  _ForgotPwdPageState createState() => _ForgotPwdPageState();
}

class _ForgotPwdPageState extends State<ForgotPwdPage> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createUi(),
    );
  }

  Widget createUi() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Get.back();
                          }),
                    ),
                    Container(height: 100,width: 100,
                        alignment: Alignment.topCenter,
                        child: Image.asset(AssetsConst.logoImg,fit: BoxFit.cover,))
                  ],
                ),
                getTxtAppColor(
                    msg: StringConst.appName,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 8),
                getTxtBlackColor(
                    msg: StringConst.forgotPassword,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 10),
                Container(
                    alignment: Alignment.center,
                    child: getTxtGreyColor(
                        msg: StringConst.forgotPasswordDesc,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        textAlign: TextAlign.center)),
                const SizedBox(height: 50),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      edtRectField(
                          control: emailCont,
                          icons: Icons.email,
                          hint: 'Email Id',
                          validate: ValidationHelper.validateEmail,
                          keyboardType: TextInputType.text),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: InkWell(
                      onTap: () {
                        final form = formKey.currentState;
                        if (formKey.currentState!.validate()) {
                          form?.save();
                          setState(() {});
                          Get.toNamed(RoutersConst.otpPage);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        margin: const EdgeInsets.only(right: 20, left: 20),
                        child: Center(
                            child: getTxtWhiteColor(
                                msg: "Set Password", fontSize: 18)),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            gradient: LinearGradient(
                                colors: [Colors.green, Colors.lightGreen],
                                begin: Alignment.bottomCenter,
                                end: Alignment.bottomLeft,
                                tileMode: TileMode.clamp)),
                      )),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailCont.dispose();
  }
}

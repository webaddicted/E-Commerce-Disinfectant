import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rallis/utils/common/global_utilities.dart';
import 'package:rallis/utils/common/validation_helper.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/assets_const.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/utils/constant/string_const.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController dobCont = TextEditingController();
  TextEditingController pwdCont = TextEditingController();
  bool passwordVisible = false;

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
                    Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AssetsConst.logoImg,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
                getTxtAppColor(
                    msg: StringConst.appName,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 8),
                getTxtBlackColor(
                    msg: StringConst.createAnAccount,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 10),
                Container(
                    alignment: Alignment.center,
                    child: getTxtGreyColor(
                        msg: StringConst.signupDesc,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        textAlign: TextAlign.center)),
                const SizedBox(height: 50),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      edtRectField(
                          control: nameCont,
                          icons: Icons.person,
                          hint: 'Name',
                          validate: ValidationHelper.validateName,
                          keyboardType: TextInputType.name),
                      const SizedBox(height: 10),
                      edtRectField(
                          control: emailCont,
                          icons: Icons.email,
                          hint: 'Email Id',
                          validate: ValidationHelper.validateEmail,
                          keyboardType: TextInputType.streetAddress),
                      const SizedBox(height: 10),
                      edtRectField(
                          control: phoneCont,
                          icons: Icons.call,
                          hint: 'Phone',
                          txtLength: 10,
                          validate: ValidationHelper.validateMobile,
                          keyboardType: TextInputType.number),
                      const SizedBox(height: 10),
                      edtDobField(
                          control: dobCont,
                          click: dobClick,
                          title: 'DOB',
                          validate: ValidationHelper.validateDob,
                          icons: Icons.date_range),
                      const SizedBox(height: 10),
                      edtPwdField(
                          control: pwdCont,
                          pwdVisible: passwordVisible,
                          pwdVisibleClick: pwdVisClick),
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
                                msg: "Register", fontSize: 18)),
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          getTxtBlackColor(msg: 'Already have an account?'),
                          getTxtAppColor(
                              msg: ' Login',
                              fontWeight: FontWeight.bold,
                              fontSize: 17)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  pwdVisClick() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailCont.dispose();
    pwdCont.dispose();
  }

  dobClick() {
    DateTime now = DateTime.now();
    print('object  Date : ${(now.year - 18)}');
    showDatePicker(
            context: Get.context!,
            initialDate: DateTime(now.year - 18),
            firstDate: DateTime(1900),
            lastDate: DateTime(now.year - 18))
        .then((value) => {dobCont.text = getddMMyyyy(value!)});
  }
}

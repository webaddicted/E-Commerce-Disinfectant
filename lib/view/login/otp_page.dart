import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:rallis/controller/login_controller.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/routers_const.dart';

/// Author : Deepak sharma(webaddicted)

class OtpPage extends GetView<LoginController> {
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final LoginController _loginController = Get.find();

  final _counter = 0.obs;

  String otp = '';
  @override
  Widget build(BuildContext context) {
    _startTimer();
    return Scaffold(
        backgroundColor: ColorConst.whiteColor,
        // resizeToAvoidBottomPadding: false,
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Get.back();
                      }),
                ],
              ),
              const SizedBox(height: 10),
              getTxtAppColor(
                  msg: 'Verification Code',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              Icon(Icons.phonelink_ring,
                  size: 80.0, color: ColorConst.appColor),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 4 / 5,
                child: getTxtBlackColor(
                  msg:
                      "Please enter the OTP sent\non your registered mobile number",
                  textAlign: TextAlign.center,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 5),
              getTxtColor(
                  txtColor: ColorConst.appColor,
                  msg: "9024061407",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              const SizedBox(height: 20),
              onlySelectedBorderPinPut(),
              const SizedBox(height: 20),
              Obx(() {
                var value = _counter.value;
                return value > 0
                    ? getTxtAppColor(
                        msg: "$value",
                        fontSize: 27,
                        fontWeight: FontWeight.bold)
                    : Container();
              }),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: const TextStyle(color: Colors.black54, fontSize: 15),
                    children: [
                      TextSpan(
                          text: " RESEND",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (_counter.value == 0) {
                                _counter.value = 30;
                                _timer.cancel();
                                // await _loginController.resentOtp();
                                _startTimer();
                              }
                            },
                          style: const TextStyle(
                              color: Color(0xFF91D3B3),
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ]),
              ),
              const SizedBox(height: 40),
              FloatingActionButton(
                onPressed: () => _verifyOtp(),
                backgroundColor: ColorConst.appColor,
                child: const Icon(Icons.arrow_forward_sharp),
              ),
              const SizedBox(height: 40),
            ],
          )),
        ));
  }

  late Timer _timer;

  void _startTimer() {
    _counter.value = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print("value : $timer  ${_counter.value}");
      if (_counter.value > 0) {
        print("value :2222    $timer  ${_counter.value}");
        _counter.value = _counter.value - 1;
      } else {
        print("value :2222 else   $timer  ${_counter.value}");
        _timer.cancel();
      }
    });
  }
  final focusNode = FocusNode();

  Widget onlySelectedBorderPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(5.0),
    );
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Form(
      child: GestureDetector(
        onLongPress: () {
          // print(_formKey.currentState.validate());
        },
        child: Pinput(
          controller: _pinPutController,
          focusNode: focusNode,
          androidSmsAutofillMethod:
          AndroidSmsAutofillMethod.smsUserConsentApi,
          listenForMultipleSmsOnAndroid: true,
          defaultPinTheme: defaultPinTheme,
          validator: (value) {
            return value == '2222' ? null : 'Pin is incorrect';
          },
          // onClipboardFound: (value) {
          //   debugPrint('onClipboardFound: $value');
          //   pinController.setText(value);
          // },
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: (pin) {
            debugPrint('onCompleted: $pin');
          },
          onChanged: (value) {
            debugPrint('onChanged: $value');
          },
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: focusedBorderColor,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: fillColor,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
        // child: Pinput(
        //   length: 5,
        //   pinAnimationType: PinAnimationType.scale,
        //   onChanged: changePin,
        //   focusNode: _pinPutFocusNode,
        //   controller: _pinPutController,
        //
        //   autovalidateMode: AutovalidateMode.onUserInteraction,
        //   withCursor: true,
        //   fieldsAlignment: MainAxisAlignment.spaceAround,
        //   textStyle: const TextStyle(fontSize: 18, color: Colors.black),
        //   eachFieldMargin: const EdgeInsets.all(0),
        //   eachFieldWidth: 45.0,
        //   eachFieldHeight: 55.0,
        //   onSubmit: (String pin) => print(pin),
        //   submittedFieldDecoration: pinPutDecoration,
        //   selectedFieldDecoration: pinPutDecoration.copyWith(
        //     color: Colors.white,
        //     border: Border.all(
        //       width: 2,
        //       color: const Color.fromRGBO(160, 215, 220, 1),
        //     ),
        //   ),
        //   followingFieldDecoration: pinPutDecoration,
        // ),
      ),
    );
  }

  void changePin(String value) => otp = value;

  _verifyOtp() async {
    Get.offAllNamed(RoutersConst.loginPage);
    // if (_loginController.otp.value.length == 5) {
    //   await LoginController.to.validateOtp();
    // }
    // Get.toNamed(RoutersConst.home_landing);
  }
}

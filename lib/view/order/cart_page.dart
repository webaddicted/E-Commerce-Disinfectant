import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/data/common/category_bean.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/dummy_data.dart';
import 'package:rallis/utils/constant/string_const.dart';

class CartPage extends GetView<HomeController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConst.greyShade50,
      body: createUi(size),
    );
  }

  Widget createUi(Size size) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            getAppBarWithBackBtn(title: StringConst.cart),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, int index) {
                  var item = productBean()[index];
                  return cartItems(item);
                },
              ),
            ),
            _checkoutSection()
          ],
        ),
      ],
    );
  }

  Widget cartItems(CategoryBean item) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(3),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image: DecorationImage(
                    image: NetworkImage(item.url), fit: BoxFit.cover)),
            alignment: Alignment.center,
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 130,
            height: 120,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: getTxtBlackColor(
                            msg: item.name.toString(),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            print("Button Pressed");
                          },
                          color: Colors.red,
                          icon: const Icon(Icons.delete),
                          iconSize: 20,
                        ),
                      )
                    ],
                  ),
                  getTxtBlackColor(
                      msg: "Price : ${StringConst.RUPEE_SYMBOL}500",
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  getTxtBlackColor(
                      msg: "Sub Total : ${StringConst.RUPEE_SYMBOL}1000",
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  Row(
                    children: <Widget>[
                      getTxtAppColor(
                          msg: "Ships Free",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      const Spacer(),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.redAccent.shade200,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: getTxtAppColor(
                                  msg: "2",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          const SizedBox(width: 4),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.lightBlue,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _checkoutSection() {
    return Card(
        elevation: 4,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Container(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          child: Wrap(children: [
            Column(
              children: [
                Container(
                  color: Colors.grey.shade400,
                  height: 2,
                  width: 100,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getTxtBlackColor(
                        msg: 'Total Qty : ',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    getTxtColor(
                        msg: '5',
                        fontSize: 16,
                        txtColor: ColorConst.greenColor,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTxtBlackColor(
                        msg: 'Total Price : ',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        getTxtColor(
                            msg: '${StringConst.RUPEE_SYMBOL} 2500',
                            fontSize: 17,
                            txtColor: ColorConst.redColor,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.end),
                        getTxtBlackColor(
                            msg: '(include all tax)',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      clipBehavior: Clip.antiAlias,
                      child: getTxtWhiteColor(
                          msg: 'Make Payment',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 10, bottom: 10),
                          backgroundColor: ColorConst.appColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                )
              ],
            ),
          ]),
        ));
  }
}

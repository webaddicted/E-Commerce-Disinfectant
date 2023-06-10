import 'dart:ui';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/data/common/category_bean.dart';
import 'package:rallis/data/common/task_item.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/dummy_data.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/utils/constant/string_const.dart';
import 'package:rallis/view/home/nav_drawer_widget.dart';
import 'package:rallis/view/list/list_page.dart';
import 'package:rallis/view/widget/banner_img_item.dart';
import 'package:rallis/view/widget/circle_category_item.dart';
import 'package:rallis/view/widget/grid_item.dart';
import 'package:rallis/view/widget/horizontal_list_ltem.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        // checkForUpdate();
        return onWillPop();
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorConst.whiteColor,
        drawer: NavDrawerWidget(),
        body: createUi(size),
      ),
    );
  }

  Widget createUi(Size size) {
    return Column(
      children: [
        toolbar(),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              const SizedBox(height: 10),
              getCateg(),
              const SizedBox(height: 10),
              wallet(),
              const SizedBox(height: 5),
              _buildActivities(),
              const SizedBox(height: 20),
              CircleCategoryItem(title: StringConst.category),
              const SizedBox(height: 10),
              BannerImgItem(title: StringConst.latestUpdate),
              const SizedBox(height: 15),
              carouselView(),
              const SizedBox(height: 10),
              GridItem(title: StringConst.category),
              const SizedBox(height: 10),
              HorizontalListItem(title: StringConst.largeHeight),

            ]),
          ),
        ),
      ],
    );
  }

  Widget getCateg() {
    return Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          var item = prodCategoryBean()[index];
          return _categoryList(item);
        },
      ),
    );
  }

  Widget _categoryList(CategoryBean item) {
    return InkWell(
      onTap: () {
        Get.toNamed(RoutersConst.productDetails);
      },
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image: DecorationImage(
                    image: NetworkImage(item.url),
                    fit: BoxFit.cover)),
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            height: 80,
          ),
          const SizedBox(height: 10),
          getTxtBlackColor(msg: item.name.toString(), fontWeight: FontWeight.bold)
        ],
      ),
    );
  }

  Widget _buildActivities() {
    return Container(
      child: _buildTitledContainer(
        "Activities",
        height: 240,
        child: Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            itemCount: activities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1 / 1,
            ),
            itemBuilder: (context, index) {
              var item = activities[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(RoutersConst.itemList);
                },
                child: SizedBox(
                  // height: 50,
                  // width: 50,
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: item.bgColor,
                          child: Icon(
                            item.icon,
                            size: 30.0,
                            color: ColorConst.whiteColor,
                          )),
                      const SizedBox(height: 5.0),
                      getTxtBlackColor(
                          msg: item.title.toString(),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Container _buildTitledContainer(String title,
      {required Widget child, double height = 20}) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getHeading(
              title: title,
              onClick: (String title) => {Get.toNamed(RoutersConst.category)}),
          ...[child]
        ],
      ),
    );
  }

  Widget carouselView() {
    var bannerRespo = categoryBean();
    return CarouselSlider.builder(
      itemCount: bannerRespo.length,
      itemBuilder: (BuildContext context, int itemIndex, int realIndex) =>
          fullListImage(
              name: bannerRespo[itemIndex].name,
              subtitle: StringConst.dummyTxtSmall),
      options: CarouselOptions(
        aspectRatio: 3.2,
//          enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
    );
  }

  Widget fullListImage(
      {String? name = "", String? subtitle = "", Function? onTap}) {
    return SizedBox(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          color: ColorConst.cyanColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 5),
                child: getTxtColor(
                    msg: name ?? "",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    txtColor: ColorConst.whiteColor),
              ),
              const SizedBox(height: 3),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: getTxtWhiteColor(
                    msg: subtitle ?? "",
                    textAlign: TextAlign.center,
                    fontSize: 16),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget wallet({String? name = "", String? subtitle = "", Function? onTap}) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      width: Get.width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          color: Colors.lightGreenAccent.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 8, right: 10, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getTxtColor(
                        msg: "Wallet Balance : ",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        txtColor: ColorConst.blackColor),
                    getTxtColor(
                        msg: "${StringConst.RUPEE_SYMBOL} 250",
                        fontSize: 18,
                        textAlign: TextAlign.right,
                        fontWeight: FontWeight.w600,
                        txtColor: ColorConst.blackColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget toolbar() {
    var action = [
      IconButton(
          icon: const Icon(
            Icons.qr_code_scanner_sharp,
            color: ColorConst.blackColor,
          ),
          onPressed: () async {
            var result = await BarcodeScanner.scan();
            showSnackbar(
                title: "Message", subTitle: result.toString(), isSuccess: true);
            Get.toNamed(RoutersConst.productDetails);
          }),
      IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: ColorConst.blackColor,
          ),
          onPressed: () {
            Get.toNamed(RoutersConst.notification);
          }),
    ];
    var backIcon = IconButton(
      icon: const Icon(
        Icons.sort,
        color: Colors.black,
      ),
      onPressed: () {
        _scaffoldKey.currentState?.openDrawer();
      },
    );
    return getAppBarWithBackBtn(
        title: StringConst.appName, icon: backIcon, actions: action);
  }
}

List<TaskItem> activities = [
  TaskItem(
      page: ListPage(),
      title: "Results",
      icon: FontAwesomeIcons.listOl,
      bgColor: Colors.amberAccent.shade100),
  TaskItem(
      page: ListPage(),
      title: "Messages",
      icon: FontAwesomeIcons.sms,
      bgColor: Colors.cyan.shade100),
  TaskItem(
      page: ListPage(),
      title: "Appointments",
      icon: FontAwesomeIcons.calendarDay,
      bgColor: Colors.deepOrange.shade100),
  TaskItem(
      page: ListPage(),
      title: "Video ",
      icon: FontAwesomeIcons.video,
      bgColor: Colors.teal.shade100),
  TaskItem(
      page: ListPage(),
      title: "Summary",
      icon: FontAwesomeIcons.fileAlt,
      bgColor: Colors.redAccent.shade100),
  TaskItem(
      page: ListPage(),
      title: "Billing",
      icon: FontAwesomeIcons.dollarSign,
      bgColor: Colors.purpleAccent.shade100),
];

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/assets_const.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/utils/constant/string_const.dart';
import 'package:rallis/view/widget/slide_dots.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: sliderLayout());

  bool inFinalPage() {
    return _currentPage == sliderArrayList.length - 1;
  }

  Widget sliderLayout() => Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: sliderArrayList.length,
              itemBuilder: (ctx, i) => pageWidget(i),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 20, bottom: 15),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!inFinalPage())
                  InkWell(
                    onTap: () => Get.offAllNamed(RoutersConst.loginPage),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: getTxtBlackColor(
                        msg: StringConst.skip,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                Container(
                    child: inFinalPage()
                        ? getStartBtn()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < sliderArrayList.length; i++)
                                SlideDots(i == _currentPage)
                            ],
                          )),
                if (!inFinalPage())
                  FloatingActionButton(
                    backgroundColor: ColorConst.whiteColor,
                    child: Icon(
                      Icons.arrow_forward,
                      color: ColorConst.appColor,
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
              ],
            ),
          )
        ],
      );

  Widget pageWidget(int index) {
    Slider slider = sliderArrayList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: Get.width,
          height: Get.height * 0.556,
          child: SvgPicture.asset(
            slider.sliderImageUrl,
            width: Get.width,
          ),
        ),
        const SizedBox(height: 20),
        getTxtColor(
          msg: slider.sliderHeading,
          fontWeight: FontWeight.w600,
          txtColor: ColorConst.appColor,
          fontSize: 19.0,
        ),
        const SizedBox(height: 10),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: getTxtBlackColor(
              msg: slider.sliderSubHeading,
              fontSize: 15.0,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget getStartBtn() {
    return Expanded(
      child: SizedBox(
        height: 45.0,
        width: 140.0,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.0),
          ),
          onPressed: () => Get.offAllNamed(RoutersConst.loginPage),
          color: ColorConst.lightGreenColor,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: getTxtWhiteColor(
              msg: StringConst.getStart,
              fontWeight: FontWeight.w700,
              fontSize: 13.0,
            ),
          )),
        ),
      ),
    );
  }
}

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  final String skipBtn;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading,
      this.skipBtn = ''});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: AssetsConst.slider1,
      sliderHeading: 'Natural Seeds',
      sliderSubHeading: StringConst.dummyTxt,
      skipBtn: 'SKIP'),
  Slider(
      sliderImageUrl: AssetsConst.slider3,
      sliderHeading: 'Natural Seeds',
      sliderSubHeading: StringConst.dummyTxt,
      skipBtn: 'SKIP'),
  Slider(
      sliderImageUrl: AssetsConst.slider2,
      sliderHeading: 'Natural Seeds',
      sliderSubHeading: StringConst.dummyTxt,
      skipBtn: ""),
];

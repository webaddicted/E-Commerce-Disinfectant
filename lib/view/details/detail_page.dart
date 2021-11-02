import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/dummy_data.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/utils/constant/string_const.dart';
import 'package:rallis/view/widget/horizontal_list_ltem.dart';
import 'package:rallis/view/widget/rating_result.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final double expandedHeight = 400.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _createUi());
  }

  Widget _createUi() {
    return Stack(children: <Widget>[
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: _helperImage(),
      ),
      Scrollbar(
        radius: const Radius.circular(5),
        thickness: 5,
        child: CustomScrollView(
          slivers: <Widget>[
            _appBarView(),
            _contentSection(),
          ],
        ),
      )
    ]);
  }

  Widget _helperImage() {
    return SizedBox(
      height: expandedHeight + 50,
      width: Get.width,
      child: Hero(
          tag: "dsdd",
          child: Container(
              child: getCacheImage(
                  url: prodCategoryBean()[4].url.toString(),
                  height: expandedHeight + 50)
              // ApiConstant.IMAGE_ORIG_POSTER + data.posterPath.toString()),
              )),
    );
  }

  Widget _appBarView() {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
//            model.movieDetails(movieId);
//            model.movieCrewCast(movieId);
//            model.fetchRecommendMovie(movieId);
//            model.fetchSimilarMovie(movieId);
//            model.movieKeyword(movieId);
          Get.back();
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      expandedHeight: expandedHeight - 50,
      snap: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
  }

  Widget _contentSection() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [getContainer()],
      ),
    );
  }

  Widget getContainer() {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorConst.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _contentTitle(),
          HorizontalListItem(title: StringConst.largeHeight),
        ],
      ),
    );
  }

  Widget _contentTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: getTxtBlackColor(
                    msg: "Product Name",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              getTxtBlackColor(
                  msg: "${StringConst.RUPEE_SYMBOL} 500",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              RatingResult(4, 12.0),
              const SizedBox(width: 5),
              RatingBar.builder(
                itemSize: 18.0,
                initialRating: 8 / 2,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: getBackgrountRate(8),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          _contentAbout(),
          const SizedBox(height: 10),
          getTxtBlackColor(
              msg: 'Overview', fontSize: 18, fontWeight: FontWeight.bold),
          const SizedBox(height: 7),
          getTxtGreyColor(
              msg: StringConst.dummyTxt,
              fontSize: 15,
              fontWeight: FontWeight.w400),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutersConst.cart);
                },
                clipBehavior: Clip.antiAlias,
                child: getTxtWhiteColor(
                    msg: 'Add To Cart',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, top: 10, bottom: 10),
                    primary: ColorConst.appColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutersConst.cart);
                },
                clipBehavior: Clip.antiAlias,
                child: getTxtWhiteColor(
                    msg: 'Buy Now',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, top: 10, bottom: 10),
                    primary: ColorConst.appColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
          )
        ],
      ),
    );
  }

  Widget _contentAbout() {
    // var relDate = "25-Dec-2021";
    // var budget = "25,55,555";
    // var revenue = "25,25,55,555";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _contentDescriptionAbout('Status', ""),
              _contentDescriptionAbout('Size', 'XXL'),
              _contentDescriptionAbout('Material Type', "Cotton"),
              _contentDescriptionAbout(
                  'Price', '${StringConst.RUPEE_SYMBOL} 500/Pcs.'),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
                width: 120,
                height: 50,
                child: Row(
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
                )),
          ),
        ],
      ),
    );
  }

  Widget _contentDescriptionAbout(String title, String? value) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            getTxtBlackColor(
                msg: title,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start),
            const Text(' : '),
            if (value == null)
              Container(
                width: 150,
                height: 10,
                color: Colors.grey[300],
              )
            else
              getTxtAppColor(
                  msg: value,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start),
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}

Color getBackgrountRate(double rate) {
  if (rate < 5.0) {
    return Colors.red;
  } else if (rate < 6.8) {
    return Colors.yellow;
  } else if (rate < 7.3) {
    return Colors.blue;
  } else {
    return Colors.green;
  }
}

import 'package:get/route_manager.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/view/complaint/complaint_page.dart';
import 'package:rallis/view/details/detail_page.dart';
import 'package:rallis/view/home/home_page.dart';
import 'package:rallis/view/list/list_page.dart';
import 'package:rallis/view/login/forgot_pwd_page.dart';
import 'package:rallis/view/login/login_page.dart';
import 'package:rallis/view/login/otp_page.dart';
import 'package:rallis/view/login/signup_page.dart';
import 'package:rallis/view/notification/notification_page.dart';
import 'package:rallis/view/order/address_page.dart';
import 'package:rallis/view/order/cart_page.dart';
import 'package:rallis/view/order/category_page.dart';
import 'package:rallis/view/order/order_history_page.dart';
import 'package:rallis/view/setting/profile_page.dart';
import 'package:rallis/view/splash/onboarding_page.dart';
import 'package:rallis/view/splash/splash_page.dart';
import 'package:rallis/view/survey/survey_page.dart';
import 'package:rallis/view/wallet/wallet_page.dart';

List<GetPage> routesPage() => [
      GetPage(name: RoutersConst.initialRoute, page: () => const SplashPage()),
      GetPage(name: RoutersConst.onboardPage, page: () => OnboardingPage()),
      GetPage(name: RoutersConst.loginPage, page: () => LoginPage()),
      GetPage(name: RoutersConst.forgotPwdPage, page: () => ForgotPwdPage()),
      GetPage(name: RoutersConst.signupPage, page: () => SignupPage()),
      GetPage(name: RoutersConst.otpPage, page: () => OtpPage()),
      GetPage(name: RoutersConst.home, page: () => HomePage()),
      GetPage(name: RoutersConst.category, page: () => CategoryPage()),
      GetPage(name: RoutersConst.itemList, page: () => ListPage()),
      GetPage(name: RoutersConst.productDetails, page: () => const DetailPage()),

      GetPage(name: RoutersConst.cart, page: () => CartPage()),
      GetPage(name: RoutersConst.orderHistory, page: () => OrderHistoryPage()),
      GetPage(name: RoutersConst.address, page: () => AddressPage()),
      GetPage(name: RoutersConst.wallet, page: () => WalletPage()),
      GetPage(name: RoutersConst.complaints, page: () => ComplaintPage()),
      GetPage(name: RoutersConst.survey, page: () => SurveyPage()),
      GetPage(name: RoutersConst.profile, page: () => ProfilePage()),
      GetPage(name: RoutersConst.notification, page: () => NotificationPage()),
      GetPage(name: RoutersConst.needHelp, page: () => HomePage()),
      GetPage(name: RoutersConst.policy, page: () => HomePage()),
      GetPage(name: RoutersConst.contactUs, page: () => HomePage()),
      GetPage(name: RoutersConst.aboutUs, page: () => HomePage()),
    ];

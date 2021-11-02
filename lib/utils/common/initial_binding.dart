import 'package:get/get.dart';
import 'package:rallis/controller/base_controller.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/controller/login_controller.dart';
import 'package:rallis/data/repo/base_repo.dart';
import 'package:rallis/data/repo/home_repo.dart';
import 'package:rallis/data/repo/login_repo.dart';
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController(BaseRepo()), fenix: true);
    Get.lazyPut(() => LoginController(LoginRepo()), fenix: true);
    Get.lazyPut(() => HomeController(HomeRepo()), fenix: true);

  }
}

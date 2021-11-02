import 'package:get/get.dart';
import 'package:rallis/data/repo/login_repo.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  LoginRepo _loginRepo;

  LoginController(this._loginRepo);
// final allCityRespo = (ApiResponse<UpdateProfileReq>()).obs;

// allCity() async {
//   allCityRespo.value = ApiResponse.loading();
//   if (employeeId.isEmpty) employeeId = await getCustomerId();
//   final data = await _homeRepo.allCity(employeeId);
//   allCityRespo.value = data;
//   // print("LoginRespo : ${callLoginRespo}");
//   return data;
// }
}

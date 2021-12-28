import 'package:get/get.dart';
import 'package:kuisioner/ui/signinPage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 5), () {
      Get.offAll(SignInPage());
    });
  }
}

import 'package:get/get.dart';

class LoadingSearchController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 5), () {
      print("masuk");
    });
  }
}

import 'package:get/get.dart';
import 'package:kuisioner/data/repository.dart';

class MainController extends GetxController {
  RxBool _loading = false.obs;
  RxBool get loading => _loading;
  RxBool _cek = false.obs;
  RxBool get cek => _cek;
  set cek(value) => _cek.value = value;
  set loading(value) => _loading.value = value;

  int _index = 0;
  int get index => _index;

  void setIndex(int index) {
    this._index = index;
    update();
  }
}

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/data/repository.dart';
import 'package:kuisioner/models/mahasiswaModel.dart';

class SigninController extends GetxController {
  final MainController mainC = Get.find();
  final box = GetStorage();
  final Repository _repository = Repository();
  String _role = null;
  String get role => _role;

  RxBool _hidePass = true.obs;
  RxBool get hidePass => _hidePass;
  set hidePass(value) => _hidePass.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(box.read("idMhs"));
  }
  // List<MahasiswaModel> _dataMhs = [];
  // List<MahasiswaModel> get dataMhs => _dataMhs;
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getAllMhs();
  // }

  // void getAllMhs() async {
  //   final data = await _repository.getAllMhs();
  //   _dataMhs = data;
  //   update();
  // }
  void setRole(value) {
    _role = value;
    update();
  }

  void loadLogin(String username, String password, String role) async {
    if (username.isEmpty) {
      mainC.loading.value = !mainC.loading.value;
      Get.snackbar(
        "Peringatan",
        "Username belum di isi!",
      );
    } else if (password.isEmpty) {
      mainC.loading.value = !mainC.loading.value;
      Get.snackbar(
        "Peringatan",
        "password belum di isi!",
      );
    } else if (role.isEmpty) {
      mainC.loading.value = !mainC.loading.value;
      Get.snackbar(
        "Peringatan",
        "role belum di isi!",
      );
    } else {
      if (role == "mahasiswa") {
        final dataMhs = await _repository.loginMhs(
            username: username, password: password, role: role);

        box.write("idMhs", dataMhs.idMhs);
      }

      if (role == "admin") {
        await _repository.loginAdmin(
            username: username, password: password, role: role);
      }
    }
  }
}

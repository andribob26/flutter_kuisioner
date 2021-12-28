import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuisioner/data/repository.dart';
import 'package:kuisioner/models/mahasiswaModel.dart';

class AdminController extends GetxController {
  final Repository _repository = Repository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void logoutAdmin() async {
    await _repository.logoutAdmin();
  }
}

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuisioner/data/repository.dart';
import 'package:kuisioner/models/mahasiswaModel.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  final Repository _repository = Repository();
  Rx<MahasiswaModel> _dataProfile = Rx<MahasiswaModel>(null);
  Rx<MahasiswaModel> get dataProfile => _dataProfile;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMhsById(box.read("idMhs"));
  }

  void logout() async {
    box.remove('idMhs');
    await _repository.logoutMhs();
  }

  void getMhsById(String id) async {
    final data = await _repository.getMhsById(id);
    _dataProfile.value = data;
    update();
  }

  void ubahPassword(
    String idMhs,
    String password,
    String passwordBaru,
  ) async {
    await _repository.ubahPass(
      idMhs: idMhs,
      password: password,
      passwordBaru: passwordBaru,
    );
  }
}

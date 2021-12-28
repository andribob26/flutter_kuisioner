import 'package:get/get.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/data/repository.dart';
import 'package:kuisioner/models/dosenModel.dart';

class DosenController extends GetxController {
  final MainController mainC = Get.find();
  final Repository _repository = Repository();
  Rx<List<DosenModel>> _dataDosen = Rx<List<DosenModel>>([]);
  Rx<List<DosenModel>> get dataDosen => _dataDosen;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllDosen();
  }

  @override
  void update([List<String> ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
    getAllDosen();
  }

  void getAllDosen() async {
    final data = await _repository.getAllDosen();
    _dataDosen.value = data;
    update();
  }

  void addDosen({
    String namaDosen,
    int nip,
    int noTelepon,
    String email,
  }) async {
    await _repository.addDosen(
      namaDosen: namaDosen,
      nip: nip,
      noTelepon: noTelepon,
      email: email,
    );
  }

  void deleteDosen(String idDosen) async {
    await _repository.deleteDosen(idDosen: idDosen);
  }

  void updateDosen({
    String idDosen,
    String namaDosen,
    int nip,
    int noTelepon,
    String email,
  }) async {
    // String id = dosenData[0];
    // String namaDosen = dosenData[1];
    // int nip = dosenData[2];
    // int noTelepon = dosenData[3];
    // String email = dosenData[4];
    // print(namaDosen);

    await _repository.updateDosen(
      idDosen: idDosen,
      namaDosen: namaDosen,
      nip: nip,
      noTelepon: noTelepon,
      email: email,
    );
  }
}

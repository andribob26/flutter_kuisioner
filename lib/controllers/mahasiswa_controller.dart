import 'package:get/get.dart';
import 'package:kuisioner/data/repository.dart';
import 'package:kuisioner/models/mahasiswaModel.dart';

class MahasiswaController extends GetxController {
  final Repository _repository = Repository();
  Rx<List<MahasiswaModel>> _dataMhs = Rx<List<MahasiswaModel>>([]);
  Rx<List<MahasiswaModel>> get dataMhs => _dataMhs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllMhs();
  }

  @override
  void update([List<String> ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
    getAllMhs();
  }

  void getAllMhs() async {
    final data = await _repository.getAllMhs();
    _dataMhs.value = data;
    update();
  }

  void addMhs({
    String namaMhs,
    int nim,
    String password,
  }) async {
    await _repository.addMhs(
      namaMhs: namaMhs,
      nim: nim,
      password: password,
    );
  }

  void deleteMhs(String idMhs) async {
    await _repository.deleteMhs(idMhs: idMhs);
  }
}

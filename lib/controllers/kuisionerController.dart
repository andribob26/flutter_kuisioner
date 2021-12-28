import 'package:get/get.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/data/repository.dart';
import 'package:kuisioner/models/dosenModel.dart';
import 'package:kuisioner/models/kuisionerModel.dart';

class KuisionerController extends GetxController {
  final MainController mainC = Get.find();
  final Repository _repository = Repository();
  Rx<List<KuisionerModel>> _dataKuisionerById = Rx<List<KuisionerModel>>([]);
  Rx<List<KuisionerModel>> get dataKuisionerById => _dataKuisionerById;
  Rx<List<KuisionerModel>> _dataKuisioner = Rx<List<KuisionerModel>>([]);
  Rx<List<KuisionerModel>> get dataKuisioner => _dataKuisioner;
  Rx<List<DosenModel>> _dataDosen = Rx<List<DosenModel>>([]);
  Rx<List<KuisionerModel>> _searchList = Rx<List<KuisionerModel>>([]);
  Rx<List<KuisionerModel>> get searchList => _searchList;
  Rx<List<DosenModel>> get dataDosen => _dataDosen;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllKuisioner();
  }

  @override
  void update([List<String> ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
    getAllKuisioner();
  }

  void getAllKuisioner() async {
    final data = await _repository.getAllKuisioner();
    _dataKuisioner.value = data;
    update();
  }

  void getAllDosen() async {
    final data = await _repository.getAllDosen();
    _dataDosen.value = data;
    update();
  }

  loadsearchResultdefault() {
    _searchList.value = _dataKuisioner.value;
  }

  void searchResult(String value) async {
    final data = await _repository.getAllKuisioner();
    _dataKuisioner.value = data
        .where((u) =>
            (u.judulKuisioner.toLowerCase().contains(value.toLowerCase())))
        .toList();
    ;
    if (_dataKuisioner.value.length == 0) {
      mainC.cek.value = true;
      print("true");
    }

    update();
  }

  void getKuisionerById(String id) async {
    final data = await _repository.getKuisionerById(id);
    print(data);
    // _dataKuisionerById.value = data;
    // update();
  }
}

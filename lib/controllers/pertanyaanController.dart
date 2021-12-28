import 'dart:convert';

import 'package:get/get.dart';
import 'package:kuisioner/data/repository.dart';
import 'package:kuisioner/models/dosenModel.dart';
import 'package:kuisioner/models/kuisionerModel.dart';
import 'package:kuisioner/models/pertanyaanModel.dart';

class PertanyaanController extends GetxController {
  final Repository _repository = Repository();
  Rx<String> _pertanyaanList = Rx<String>(null);
  Rx<String> get pertanyaanList => _pertanyaanList;
  Rx<List> _listDosen = Rx<List>([]);
  Rx<List> get listDosen => _listDosen;
  Rx<List<KuisionerModel>> _dataKuisioner = Rx<List<KuisionerModel>>([]);
  Rx<List<KuisionerModel>> get dataKuisioner => _dataKuisioner;
  Rx<KuisionerModel> _dataKuisionerById = Rx<KuisionerModel>();
  Rx<KuisionerModel> get dataKuisionerById => _dataKuisionerById;
  Rx<List<String>> _pertanyaan = Rx<List<String>>([]);
  Rx<List<String>> get pertanyaan => _pertanyaan;
  Rx<List<String>> _hasilKuis = Rx<List<String>>([]);
  Rx<List<String>> get hasilKuis => _hasilKuis;
  Rx<Map<String, dynamic>> _pilih = Rx<Map<String, dynamic>>({});
  Rx<Map<String, dynamic>> get pilih => _pilih;
  List _dataById = [];
  List get dataById => _dataById;
  Rx<DosenModel> _dataDosen = Rx<DosenModel>(null);
  Rx<DosenModel> get dataDosen => _dataDosen;

  RxString _dosenValue = "".obs;
  RxString get dosenValue => _dosenValue;
  set dosenValue(value) => _dosenValue.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllKuisioner();
    loadListDosen();
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

  Future<void> getDosenById(String id) async {
    final data = await _repository.getDosenById(id);
    _dataDosen.value = data;
  }

  void loadListDosen() async {
    final data = await _repository.getAllDosen();
    for (int i = 0; i < data.length; i++) {
      _listDosen.value.add({
        "display": "${data[i].namaDosen}",
        "value": "${data[i].id}",
      });
    }
    // _dataKuisioner.value = data;
  }

  // void addPertanyaan({
  //   String pertanyaan,
  // }) async {
  //   await _repository.addPertanyaan(pertanyaan: pertanyaan);
  // }

  void setPilih(String key, dynamic val) {
    _pilih.value[key] = val;
  }

  void simpanKuis(
    String idDosen,
    String idMhs,
    String namaMhs,
    String idKuisoner,
    String judulKuis,
    Map hasil,
  ) async {
    // List dataHasil = [];

    // for (var i = 0; i < hasil.length; i++) {
    //   // print(newList[i] == "Baik");
    //   if (hasil[i] == "Sangat baik") {
    //     dataHasil.add({
    //       '"idPertanyaan":"${idPertanyaan[i]}", "sangatBaik": 1, "baik": 0, "cukup": 0, "kurang": 0, "sangatKurang": 0'
    //     });
    //   }
    //   if (hasil[i] == "Baik") {
    //     dataHasil.add({
    //       '"idPertanyaan":"${idPertanyaan[i]}", "sangatBaik": 0, "baik": 1, "cukup": 0, "kurang": 0, "sangatKurang": 0'
    //     });
    //   }
    //   if (hasil[i] == "Cukup") {
    //     dataHasil.add({
    //       '"idPertanyaan":"${idPertanyaan[i]}", "sangatBaik": 0, "baik": 0, "cukup": 1, "kurang": 0, "sangatKurang": 0'
    //     });
    //   }
    //   if (hasil[i] == "Kurang") {
    //     dataHasil.add({
    //       '"idPertanyaan":"${idPertanyaan[i]}", "sangatBaik": 0, "baik": 0, "cukup": 0, "kurang": 1, "sangatKurang": 0'
    //     });
    //   }
    //   if (hasil[i] == "Sangat Kurang") {
    //     dataHasil.add({
    //       '"idPertanyaan":"${idPertanyaan[i]}", "sangatBaik": 0, "baik": 0, "cukup": 0, "kurang": 0, "sangatKurang": 1'
    //     });
    //   }
    // }

    // List jsonHasil = jsonDecode(dataHasil.toString());

    Map<String, dynamic> dataKuis = {
      "idMhs": idMhs,
      "namaMhs": namaMhs,
      "idKuisioner": idKuisoner,
      "judulKuisioner": judulKuis,
      "hasilKuis": [hasil]
    };

    print(dataKuis);

    await _repository.addKuis(id: idDosen, data: dataKuis);
  }

  void simpanPertanyaan(String judul, List pertanyaan) async {
    List dataPertanyaan = [];
    for (var i = 0; i < pertanyaan.length; i++) {
      dataPertanyaan.add({'"judulPertanyaan":"${pertanyaan[i]}"'});
    }
    List jsonPertanyaan = jsonDecode(dataPertanyaan.toString());
    Map<String, dynamic> dataKuisioner = {
      "judulKuisioner": judul,
      "pertanyaan": jsonPertanyaan,
    };

    // print(dataKuisioner);

    await _repository.addPertanyaan(data: dataKuisioner);
  }

  void getKuisionerById(String id) async {
    final data = await _repository.getKuisionerById(id);

    _dataKuisionerById.value = data;
    // update();
  }

  void deleteKuisioner(String idKuisioner) async {
    await _repository.deleteKuisioner(idKuisioner: idKuisioner);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/controllers/pertanyaanController.dart';
import 'package:kuisioner/controllers/profilController.dart';
import 'package:kuisioner/models/kuisionerModel.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class IsiKuisPage extends StatefulWidget {
  @override
  _IsiKuisPageState createState() => _IsiKuisPageState();
}

class _IsiKuisPageState extends State<IsiKuisPage> {
  final box = GetStorage();

  final MainController mainC = Get.find();
  final ProfileController profileC = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Isi Kuisioner"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.blue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
        ),
        body: GetBuilder<PertanyaanController>(
          init: PertanyaanController(),
          builder: (_) {
            _.getKuisionerById(box.read("id"));
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          bottom: 15.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: (_.dataKuisionerById.value.isNull)
                            ? Text(
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0),
                              )
                            : Text(
                                "${_.dataKuisionerById.value.judulKuisioner}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0),
                              )),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    height: 0,
                    thickness: 3,
                    // indent: 20,
                    endIndent: 0,
                  ),
                  Obx(
                    () => Container(
                      color: Colors.white,
                      child: DropDownFormField(
                        contentPadding:
                            EdgeInsets.only(left: 10.0, right: 10.0),
                        titleText: null,
                        hintText: 'Pilih Dosen',
                        value: _.dosenValue.value,
                        onSaved: (value) {
                          _.dosenValue.value = value;
                        },
                        onChanged: (value) async {
                          await _.getDosenById(value);
                          List idMhs = [];
                          List idKuisioner = [];
                          for (int i = 0;
                              i < _.dataDosen.value.kuisioner.length;
                              i++) {
                            idMhs.add(_.dataDosen.value.kuisioner[i].idMhs);
                            idKuisioner.add(
                                _.dataDosen.value.kuisioner[i].idKuisioner);
                          }

                          if (idMhs
                                  .contains(profileC.dataProfile.value.idMhs) &&
                              idKuisioner
                                  .contains(_.dataKuisionerById.value.id)) {
                            Get.snackbar("hai",
                                "Anda sudah mengisi kuisioner dosen ini");
                          } else {
                            _.dosenValue.value = value;
                          }
                        },
                        dataSource: _.listDosen.value,
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => (_.dataKuisionerById.value.isNull)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              // padding: EdgeInsets.only(top: 2, bottom: 2),
                              itemCount:
                                  _.dataKuisionerById.value.pertanyaan.length,
                              itemBuilder: (context, index) {
                                final pertanyaan =
                                    _.dataKuisionerById.value.pertanyaan[index];

                                // print(pertanyaan.id);

                                // final dosen = _.dataDosen.value[index];
                                return Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      // margin: EdgeInsets.all(1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${pertanyaan.judulPertanyaan}",
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            Obx(() {
                                              // print(_.pilih
                                              //     .value[pertanyaan.pertanyaan]);
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: "sangatBaik",
                                                        groupValue: _.pilih
                                                                        .value[
                                                                    pertanyaan
                                                                        .id] !=
                                                                null
                                                            ? _.pilih.value[
                                                                pertanyaan.id]
                                                            : "",
                                                        onChanged: (value) {
                                                          _.setPilih(
                                                              pertanyaan.id,
                                                              value);
                                                        },
                                                      ),
                                                      Text("Sangat baik"),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: "baik",
                                                        groupValue: _.pilih
                                                                        .value[
                                                                    pertanyaan
                                                                        .id] !=
                                                                null
                                                            ? _.pilih.value[
                                                                pertanyaan.id]
                                                            : "",
                                                        onChanged: (value) {
                                                          _.setPilih(
                                                              pertanyaan.id,
                                                              value);
                                                        },
                                                      ),
                                                      Text("Baik"),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: "cukup",
                                                        groupValue: _.pilih
                                                                        .value[
                                                                    pertanyaan
                                                                        .id] !=
                                                                null
                                                            ? _.pilih.value[
                                                                pertanyaan.id]
                                                            : "",
                                                        onChanged: (value) {
                                                          _.setPilih(
                                                              pertanyaan.id,
                                                              value);
                                                        },
                                                      ),
                                                      Text("Cukup"),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: "kurang",
                                                        groupValue: _.pilih
                                                                        .value[
                                                                    pertanyaan
                                                                        .id] !=
                                                                null
                                                            ? _.pilih.value[
                                                                pertanyaan.id]
                                                            : "",
                                                        onChanged: (value) {
                                                          _.setPilih(
                                                              pertanyaan.id,
                                                              value);
                                                        },
                                                      ),
                                                      Text("Kurang"),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: "sangatKurang",
                                                        groupValue: _.pilih
                                                                        .value[
                                                                    pertanyaan
                                                                        .id] !=
                                                                null
                                                            ? _.pilih.value[
                                                                pertanyaan.id]
                                                            : "",
                                                        onChanged: (value) {
                                                          print(pertanyaan.id);
                                                          _.setPilih(
                                                              pertanyaan.id,
                                                              value);
                                                        },
                                                      ),
                                                      Text("Sangat kurang"),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[200],
                                      height: 0,
                                      thickness: 2,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ],
                                );
                              },
                            ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    height: 0,
                    thickness: 3,
                    // indent: 20,
                    endIndent: 0,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: (mainC.loading.value)
                            ? InkWell(
                                child: Container(
                                  child: Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  // mainC.loading.value = !mainC.loading.value;
                                  // print(_.pilih.value.values);
                                  List idPertanyaan =
                                      _.pilih.value.keys.toList();
                                  List hasil = _.pilih.value.values.toList();

                                  // print(_.pilih.value.values);

                                  var map = Map();

                                  hasil.forEach((h) {
                                    if (!map.containsKey(h)) {
                                      map[h] = 1;
                                    } else {
                                      map[h] += 1;
                                    }
                                  });
                                  // print(_.dosenValue.value);
                                  // print(profileC.dataProfile.value.idMhs);
                                  // print(profileC.dataProfile.value.namaMhs);
                                  // print(_.dataKuisionerById.value.id);
                                  // print(
                                  //     _.dataKuisionerById.value.judulKuisioner);
                                  // print(map);
                                  if (_.dosenValue.value.isEmpty) {
                                    Get.snackbar("hai",
                                        "Mohon cek kembali mungkin ada yang lupa!");
                                  } else {
                                    if (_.dataKuisionerById.value.pertanyaan
                                            .length !=
                                        _.pilih.value.length) {
                                      Get.snackbar("hai",
                                          "Mohon cek kembali mungkin ada yang lupa!");
                                    } else {
                                      mainC.loading.value =
                                          !mainC.loading.value;
                                      _.simpanKuis(
                                        _.dosenValue.value,
                                        profileC.dataProfile.value.idMhs,
                                        profileC.dataProfile.value.namaMhs,
                                        _.dataKuisionerById.value.id,
                                        _.dataKuisionerById.value
                                            .judulKuisioner,
                                        map,
                                      );
                                    }
                                  }

                                  // _.simpanKuis(
                                  //     "namaDosen", idPertanyaan, hasil);
                                },
                                child: Container(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Simpan",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

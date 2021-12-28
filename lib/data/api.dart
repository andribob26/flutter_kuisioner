import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:kuisioner/controllers/kuisionerController.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/models/adminModel.dart';
import 'package:kuisioner/models/dosenModel.dart';
import 'package:kuisioner/models/kuisionerModel.dart';
import 'package:kuisioner/models/mahasiswaModel.dart';
import 'package:kuisioner/models/pertanyaanModel.dart';
import 'package:kuisioner/ui/admin/mainPageAdmin.dart';
import 'package:kuisioner/ui/mainPage.dart';
import 'package:kuisioner/ui/signinPage.dart';

class Api extends GetxController {
  final MainController mainC = Get.find();
  Dio dio = Dio();

  // dosen-api
  Future<List<DosenModel>> getAllDosen() async {
    Response response =
        await dio.get("https://kuisionerapp.herokuapp.com/dosen");
    List dataRaw = response.data["dosenData"];
    List<DosenModel> dataDosen =
        dataRaw.map((e) => DosenModel.fromJson(e)).toList();
    mainC.cek.value = false;
    mainC.loading.value = false;

    return dataDosen;
  }

  Future<DosenModel> getDosenById(String id) async {
    Response response =
        await dio.get("https://kuisionerapp.herokuapp.com/dosen/$id");
    Map rawData = response.data["dosenData"];
    // produkBox.write("id${rawData["cloudinaryId"]}", rawData["id"]);
    return DosenModel.fromJson(rawData);
    // List<KuisionerModel> dataKuisioner =
    //     dataRaw.map((e) => KuisionerModel.fromJson(e)).toList();
    // return dataKuisioner;
  }

  Future<void> addDosen(
    String namaDosen,
    int nip,
    int noTelepon,
    String email,
  ) async {
    Map<String, dynamic> data = {
      "namaDosen": namaDosen,
      "nip": nip,
      "noTelepon": noTelepon,
      "email": email,
    };
    await dio.post("https://kuisionerapp.herokuapp.com/dosen/add_dosen/",
        data: data);
    print(data);
    mainC.loading.value = !mainC.loading.value;
    Get.back();
  }

  Future<void> deleteDosen(String idDosen) async {
    print(idDosen);
    try {
      await dio.delete(
          "https://kuisionerapp.herokuapp.com/dosen/delete_dosen/$idDosen");
      Get.back();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future<void> updateDosen(
    String idDosen,
    String namaDosen,
    int nip,
    int noTelepon,
    String email,
  ) async {
    Map<String, dynamic> data = {
      "namaDosen": namaDosen,
      "nip": nip,
      "noTelepon": noTelepon,
      "email": email,
    };

    try {
      await dio.put(
          "https://kuisionerapp.herokuapp.com/dosen/update_dosen/$idDosen",
          data: data);
      mainC.loading.value = !mainC.loading.value;
      Get.back();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  //mahasiswa api

  Future<void> addMhs(
    String namaMhs,
    int nim,
    String password,
  ) async {
    Map<String, dynamic> data = {
      "namaMhs": namaMhs,
      "nim": nim,
      "password": password,
      "role": "mahasiswa",
    };
    await dio.post(
        "https://kuisionerapp.herokuapp.com/mahasiswa/add_mahasiswa/",
        data: data);
    print(data);
    mainC.loading.value = !mainC.loading.value;
    Get.back();
  }

  Future<List<MahasiswaModel>> getAllMhs() async {
    Response response =
        await dio.get("https://kuisionerapp.herokuapp.com/mahasiswa");
    List dataRaw = response.data["mahasiswaData"];
    List<MahasiswaModel> dataMhs =
        dataRaw.map((e) => MahasiswaModel.fromJson(e)).toList();
    // mainC.cek.value = false;
    // mainC.loading.value = false;

    return dataMhs;
  }

  Future<MahasiswaModel> getMhsIsLogin() async {
    Response response =
        await dio.get("https://kuisionerapp.herokuapp.com/mahasiswa/profil/");
    Map rawData = response.data["profileData"];
    print(response);
    // produkBox.write("id${rawData["cloudinaryId"]}", rawData["id"]);
    return MahasiswaModel.fromJson(rawData);
    // List<KuisionerModel> dataKuisioner =
    //     dataRaw.map((e) => KuisionerModel.fromJson(e)).toList();
    // return dataKuisioner;
  }

  Future<MahasiswaModel> getMhsById(String id) async {
    Response response =
        await dio.get("https://kuisionerapp.herokuapp.com/mahasiswa/$id");
    Map rawData = response.data["mahasiswaData"];
    // produkBox.write("id${rawData["cloudinaryId"]}", rawData["id"]);
    return MahasiswaModel.fromJson(rawData);
    // List<KuisionerModel> dataKuisioner =
    //     dataRaw.map((e) => KuisionerModel.fromJson(e)).toList();
    // return dataKuisioner;
  }

  Future<void> deleteMhs(String idMhs) async {
    try {
      await dio.delete(
          "https://kuisionerapp.herokuapp.com/mahasiswa/delete_mahasiswa/$idMhs");
      Get.back();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future<void> ubahPass(
    String idMhs,
    String password,
    String passwordBaru,
  ) async {
    Map<String, dynamic> data = {
      "password": password,
      "passwordBaru": passwordBaru,
    };
    print(data);
    try {
      await dio.post(
          "https://kuisionerapp.herokuapp.com/mahasiswa/ubah_password/$idMhs",
          data: data);
      mainC.loading.value = !mainC.loading.value;
      Get.back();
      Get.snackbar(
        "Peringatan",
        "Password berhasil di ubah",
      );
    } on DioError catch (e) {
      mainC.loading.value = !mainC.loading.value;
      if (e.response.statusCode == 400) {
        Get.snackbar(
          "Peringatan",
          "Password Salah!",
        );
      }
    }
  }

  // pertanyaan-api
  Future<List<PertanyaanModel>> getAllPertanyaan() async {
    Response response =
        await dio.get("https://kuisionerapp.herokuapp.com/pertanyaan/");
    List dataRaw = response.data["pertanyaanData"];
    List<PertanyaanModel> dataPertanyaan =
        dataRaw.map((e) => PertanyaanModel.fromJson(e)).toList();
    return dataPertanyaan;
  }

  Future<void> addPertanyaan(Map data) async {
    await dio.post(
        "https://kuisionerapp.herokuapp.com/pertanyaan/add_pertanyaan/",
        data: data);
    print(data);
    mainC.loading.value = !mainC.loading.value;

    Get.back();
  }

  //kuis
  Future<void> addKuis(String id, Map data) async {
    // Map<String, dynamic> data = {
    //   "namaDosen": namaDosen,
    //   "nip": nip,
    //   "noTelepon": noTelepon,
    //   "email": email,
    // };
    await dio.put("https://kuisionerapp.herokuapp.com/kuis/add_kuis/$id",
        data: data);
    print(data);
    mainC.loading.value = !mainC.loading.value;
    Get.back();
  }

  //kuisioner
  Future<List<KuisionerModel>> getAllKuisioner() async {
    Response response =
        await dio.get("https://kuisionerapp.herokuapp.com/kuisioner/");
    List dataRaw = response.data["kuisionerData"];
    List<KuisionerModel> dataKuisioner =
        dataRaw.map((e) => KuisionerModel.fromJson(e)).toList();
    return dataKuisioner;
  }

  Future<void> deleteKuisioner(String idKuisioner) async {
    try {
      await dio.delete(
          "https://kuisionerapp.herokuapp.com/kuisioner/delete_kuisioner/$idKuisioner");
      Get.back();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future<KuisionerModel> getKuisionerById(String id) async {
    Response response =
        await dio.get("https://kuisionerapp.herokuapp.com/kuisioner/$id");
    Map rawData = response.data["kuisionerData"];
    // produkBox.write("id${rawData["cloudinaryId"]}", rawData["id"]);
    return KuisionerModel.fromJson(rawData);
    // List<KuisionerModel> dataKuisioner =
    //     dataRaw.map((e) => KuisionerModel.fromJson(e)).toList();
    // return dataKuisioner;
  }

  //loginMhs
  Future<MahasiswaModel> loginMhs(
      String username, String password, String role) async {
    Map<String, dynamic> requestData = {
      "nim": username,
      "password": password,
      "role": role
    };
    // print(requestData);
    try {
      Response response = await dio.post(
          "https://kuisionerapp.herokuapp.com/mahasiswa/login",
          data: requestData);
      Map rawData = response.data["mahasiswaData"];
      // produkBox.write("id${rawData["cloudinaryId"]}", rawData["id"]);

      // print("masuk main");

      Get.offAll(MainPage());
      mainC.loading.value = !mainC.loading.value;
      return MahasiswaModel.fromJson(rawData);
    } on DioError catch (e) {
      if (e.response.data["message"] == "Username tidak di temukan") {
        // print("masuk error");
        mainC.loading.value = !mainC.loading.value;
        Get.snackbar(
          "Peringatan",
          "Username tidak di temukan!",
        );
      }

      if (e.response.data["message"] == "User password salah!") {
        mainC.loading.value = !mainC.loading.value;
        Get.snackbar(
          "Peringatan",
          "User Password Salah!",
          // snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> logoutMhs() async {
    // print(requestData);
    try {
      await dio.get("https://kuisionerapp.herokuapp.com/mahasiswa/logout");
      // print("masuk main");
      Get.offAll(SignInPage());
    } on DioError catch (e) {}
  }

  //login admin
  Future<AdminModel> loginAdmin(
      String username, String password, String role) async {
    Map<String, dynamic> requestData = {
      "username": username,
      "password": password,
      "role": role
    };
    // print(requestData);
    try {
      Response response = await dio.post(
          "https://kuisionerapp.herokuapp.com/admin/login",
          data: requestData);
      Map rawData = response.data["adminData"];
      // produkBox.write("id${rawData["cloudinaryId"]}", rawData["id"]);

      // print("masuk main");
      Get.offAll(MainPageAdmin());
      mainC.loading.value = !mainC.loading.value;
      return AdminModel.fromJson(rawData);
    } on DioError catch (e) {
      if (e.response.data["message"] == "Username tidak di temukan") {
        // print("masuk error");
        mainC.loading.value = !mainC.loading.value;
        Get.snackbar(
          "Peringatan",
          "Username tidak di temukan!",
        );
      }

      if (e.response.data["message"] == "User password salah!") {
        mainC.loading.value = !mainC.loading.value;
        Get.snackbar(
          "Peringatan",
          "User Password Salah!",
          // snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> logoutAdmin() async {
    // print(requestData);
    try {
      Response response =
          await dio.get("https://kuisionerapp.herokuapp.com/admin/logout/");
      print(response);
      // print("masuk main");
      // Get.offAll(SignInPage());
    } on DioError catch (e) {}
  }
}
